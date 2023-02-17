class User {
  String id;
  String name;
  String lastname;
  String birthday;
  List<String> address;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        name = jsonMap['name'],
        lastname = jsonMap['lastname'],
        birthday = jsonMap['birthday'],
        address = jsonMap['address'] == null ? [] : jsonMap['address'];
}
