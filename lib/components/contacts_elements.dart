import 'package:amoresms/model/contacts.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';

class ContactElement extends StatelessWidget {
  final Contacts contacts;
  const ContactElement({Key key, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('${contacts.photo}'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${contacts.name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    contacts.status == "online" ? 'Online' : 'Offline',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: contacts.status == "online" ? green : lightGrey,
                shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
