import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shakl yaratish misoli'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Ismingiz'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Iltimos, ismingizni kiriting';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Iltimos, email kiriting';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Parol'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Iltimos, parol kiriting';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ma\'lumotlar yuborildi')),
                  );
                }
              },
              child: Text('Yuborish'),
            ),
          ],
        ),
      ),
    );
  }
}
