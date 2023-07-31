import 'package:flutter/material.dart';
import 'package:test_task/models/contact.dart';

class InfoContact extends StatelessWidget {
  final Contact selectContact;
  const InfoContact({Key? key, required this.selectContact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
              child: Icon(
                Icons.account_box,
                size: 140,
                color: Colors.blue,
              ),
            ),
            getTitleAndSubtitle("Название контакта: ", selectContact.name),
            getTitleAndSubtitle("Номер телефона: ", selectContact.phoneNumber),
            getTitleAndSubtitle("Электронный адрес: ", selectContact.email),
          ],
        ),
      ),
    );
  }

  Widget getTitleAndSubtitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 10,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
