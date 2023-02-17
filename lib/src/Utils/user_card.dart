import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget(
      {Key key,
      @required this.name,
      @required this.lastname,
      @required this.birthday,
      @required this.address})
      : super(key: key);

  final String name;
  final String lastname;
  final String birthday;
  final List<String> address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      name + " " + lastname,
                      style: Theme.of(context).textTheme.body2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Fecha de Nacimiento:  " + birthday,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: address.length,
                  itemBuilder: (context, index) {
                    return addressInput(index, address[index]);
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          )),
    );
  }

  Widget addressInput(index, address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dirección #${index + 1} : ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            address,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
