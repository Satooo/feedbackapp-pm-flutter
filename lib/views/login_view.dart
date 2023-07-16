import 'dart:convert';

import 'package:feedbackapp/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  FocusNode myfocus1 = FocusNode();
  FocusNode myfocus2 = FocusNode();
  final _formKey = GlobalKey<FormState>();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final usuario = _userController.text;
    final pass = _passController.text;

    await Auth().logearUsuario(usuario, pass);
  }

  // Future<void> fireFun(user, pass) async {
  //   var firebase = await Firebase.initializeApp();
  //   var rtdb = FirebaseDatabase.instanceFor(
  //       app: firebase,
  //       databaseURL: 'https://feedbackapp-a93bf-default-rtdb.firebaseio.com/');

  //   DatabaseReference ref = rtdb.ref("users/${user}");
  //   await ref.set({"user": user, "pass": pass});
  // }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3949ab),
        toolbarHeight: 0,
      ),
      body: Center(
          child: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xffe8eaf6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'SampleBrand',
              style: TextStyle(fontSize: 30.0),
            ),
            const Text.rich(
              style: TextStyle(fontSize: 20.0),
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Feedback',
                      style: TextStyle(fontStyle: FontStyle.normal)),
                  TextSpan(
                      text: 'App',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  myfocus1.unfocus();
                  myfocus2.unfocus();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  padding: const EdgeInsets.all(20.0),
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Usuario")],
                      ),
                      TextFormField(
                          focusNode: myfocus1,
                          style: const TextStyle(fontSize: 14),
                          controller: _userController,
                          decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa un correo';
                            }

                            String emailRegex =
                                r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                            if (!RegExp(emailRegex).hasMatch(value)) {
                              return 'Ingresa un correo válido';
                            }
                            return null;
                          }),
                      const Padding(padding: EdgeInsets.all(5.0)),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Contraseña")],
                      ),
                      TextFormField(
                          focusNode: myfocus2,
                          style: const TextStyle(fontSize: 14),
                          controller: _passController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Coloca una contraseña';
                            }
                            return null;
                          })
                    ]),
                  ),
                )),
            const Padding(padding: EdgeInsets.all(10.0)),
            Container(
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: Color(0xff3f51b5),
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    onPressed: () {
                      handleSubmit();
                      // logearUsuario(_userController.text, _passController.text);
                    },
                    child: const Text("Ingresar"))),
            Padding(padding: EdgeInsets.all(20.0)),
            Container(
                width: 250,
                child: TextButton(
                  style:
                      TextButton.styleFrom(foregroundColor: Color(0xffec407a)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: const Text("No tiene cuenta? Registrate"),
                ))
          ],
        ),
      )),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
