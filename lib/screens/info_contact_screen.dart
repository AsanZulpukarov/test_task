import 'package:flutter/material.dart';
import 'package:test_task/models/contact.dart';

class InfoContact extends StatelessWidget {
  Contact selectContact;
  InfoContact({Key? key, required this.selectContact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          getTitleAndSubtitle("Название контакта: ", selectContact.name),
          getTitleAndSubtitle("Номер телефона: ", selectContact.phoneNumber),
          getTitleAndSubtitle("Электронный адрес: ", selectContact.email),
        ]),
      ),
    );
  }

  Widget getTitleAndSubtitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Divider(
          height: 2,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
