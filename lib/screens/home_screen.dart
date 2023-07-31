import 'package:flutter/material.dart';
import 'package:test_task/models/contact.dart';
import 'package:test_task/screens/add_contact_screen.dart';
import 'package:test_task/screens/info_contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static List<Contact> contacts = [
    Contact(
        name: 'Асан Зулпукаров',
        phoneNumber: '1234567890',
        email: 'zulpukarovasan32@gmail.com'),
    Contact(name: 'Апам', phoneNumber: '9876543210', email: 'apa@family.com'),
    Contact(name: 'Нурсултан', phoneNumber: '5555555555', email: 'nurs@dos.kg'),
    Contact(
        name: 'Куратор',
        phoneNumber: '1111111111',
        email: 'teacher@manas.edu.kg'),
    Contact(
        name: 'Flutter',
        phoneNumber: '0000000000',
        email: 'flutter@flutter.com')
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Мои контакты"),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: HomeScreen.contacts.length,
          itemBuilder: (context, index) {
            final item = HomeScreen.contacts.elementAt(index);
            return Dismissible(
              key: Key(item.phoneNumber),
              onDismissed: (direction) {
                setState(() {
                  HomeScreen.contacts.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} удален'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: Text(item.name),
                subtitle: Text(item.phoneNumber),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoContact(selectContact: item),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 4,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddContactScreen(),
              ),
            );
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
