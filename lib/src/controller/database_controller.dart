import 'package:sqflite/sqflite.dart';

class DataBaseController {
  CreateTable() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + 'usersdb.db';

      Database db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, lastname TEXT, birthday datetime)');
        await db.execute(
            'CREATE TABLE Address (id INTEGER PRIMARY KEY, id_user INTEGER, address TEXT, FOREIGN KEY (id_user) REFERENCES User(id))');
      });

      await db.close();
    } catch (e) {
      print(e);
    }
  }

  Future<int> InsertUser(name, lastname, birthday) async {
    int idUser;
    try {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + 'usersdb.db';

      var db = await openDatabase(path);

      await db.transaction((txn) async {
        int id = await txn.rawInsert(
            'INSERT INTO User(name, lastname, birthday) VALUES(?, ?, ?)',
            [name, lastname, birthday]);

        idUser = id;
      });

      await db.close();
      return idUser;
    } catch (e) {
      print(e);
    }
  }

  InsertAddress(id_user, addresses) async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + 'usersdb.db';
      var db = await openDatabase(path);

      for (String address in addresses) {
        await db.transaction((txn) async {
          int id = await txn.rawInsert(
              'INSERT INTO Address(id_user, address) VALUES(?, ?)',
              [id_user, address]);
        });
      }

      await db.close();
    } catch (e) {
      print(e);
    }
  }

  GetUser() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + 'usersdb.db';
      var db = await openDatabase(path);

      List<Map> list = await db.rawQuery('SELECT * FROM User');
      List<Map> listAddress = await db.rawQuery('SELECT * FROM Address');

      await db.close();
      return [list, listAddress];
    } catch (e) {
      print(e);
      return null;
    }
  }

  DeleteUser(id) async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + 'usersdb.db';
      var db = await openDatabase(path);

      await db.rawDelete('DELETE FROM User WHERE id = ?', [id]);
    } catch (e) {
      print(e);
    }
  }

  DeleteBd() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = databasesPath + 'usersdb.db';
      await deleteDatabase(path);
    } catch (e) {
      print(e);
    }
  }
}
