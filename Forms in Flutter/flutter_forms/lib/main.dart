import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter forms'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: 'Email'),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Email required';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Password required';
                }
                if (value.length < 8) {
                  return 'Password needs to be at leas 8 characters';
                }
              },
            ),
            RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  print('The form is valid');
                }
              },
              child: Text('Submit'),
            ),
          ]
        )),
      ),
    );
  }
}
