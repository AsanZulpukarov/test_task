import 'package:flutter/material.dart';
import 'package:test_task/models/contact.dart';
import 'package:test_task/screens/home_screen.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  OutlineInputBorder borderStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _nameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      FocusScope.of(context).requestFocus(_nameFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавить контакт"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  focusNode: _nameFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите название контакта';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nameController.text = value!;
                  },
                  decoration: InputDecoration(
                      border: borderStyle,
                      label: const Text("Введите название контакта"),
                      prefixIcon: const Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _phoneNumberFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите номер телефона';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumberController.text = value!;
                  },
                  decoration: InputDecoration(
                      border: borderStyle,
                      label: const Text("Введите номер контакта"),
                      prefixIcon: const Icon(Icons.call)),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: _emailFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите адрес электронной почты';
                    }
                    if (!value.contains('@')) {
                      return 'Неверный формат адреса электронной почты';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _emailController.text = value!;
                  },
                  decoration: InputDecoration(
                      border: borderStyle,
                      label: const Text("Введите email контакта"),
                      prefixIcon: const Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        HomeScreen.contacts.add(Contact(
                            name: _nameController.value.text,
                            phoneNumber: _phoneNumberController.value.text,
                            email: _emailController.value.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.green,
                              content: Text(
                                'Контакт добавлен',
                                style: TextStyle(fontSize: 20),
                              )),
                        );
                        Navigator.pop(
                          context,
                        );
                      }
                    },
                    child: const Text("Добавить"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
