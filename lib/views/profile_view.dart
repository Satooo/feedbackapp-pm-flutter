import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:feedbackapp/firebase/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  FocusNode myfocus1 = FocusNode();
  FocusNode myfocus2 = FocusNode();
  FocusNode myfocus3 = FocusNode();
  FocusNode myfocus4 = FocusNode();

  var nombre = "";
  var apellido = "";
  var contrasena = "";
  var password = "";

  var updated = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> obtenerPreguntas() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get();
      nombre = doc.data()!['nombre'];
      apellido = doc.data()!['apellido'];
      password = doc.data()!['password'];
      debugPrint(nombre);
      if (updated == false) {
        setState(() {
          _nombreController.text = nombre;
          _apellidosController.text = apellido;
          _passController.text = password;
        });
      }
      updated = true;
    } catch (e) {
      debugPrint("Error obteniendo datos");
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  activityCard(activityName, activityId) {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(20.0),
          width: 350,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              activityName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              children: [
                Spacer(),
                Container(
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Color(0xff3f51b5),
                            foregroundColor: Colors.white,
                            shape: StadiumBorder()),
                        onPressed: () {
                          Navigator.pushNamed(context, "/rating");
                        },
                        child: const Text("Calificar")))
              ],
            )
          ]),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    obtenerPreguntas();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: const Color(0xff3949ab),
        toolbarHeight: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: GestureDetector(
          onTap: () {
            myfocus1.unfocus();
            myfocus2.unfocus();
            myfocus3.unfocus();
            myfocus4.unfocus();
          },
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
            constraints: const BoxConstraints.expand(),
            color: const Color(0xffe8eaf6),
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              children: <Widget>[
                Container(
                  height: 100,
                  child: Expanded(
                      child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      Container(
                          width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15.0),
                                  backgroundColor: Color(0xff3f51b5),
                                  foregroundColor: Colors.white,
                                  shape: StadiumBorder()),
                              onPressed: () {
                                Navigator.pushNamed(context, "/");
                              },
                              child: const Text("Volver"))),
                      Spacer(),
                      Padding(padding: EdgeInsets.only(right: 20.0))
                    ],
                  )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 350,
                  child: Expanded(
                      child: Column(children: [
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Container(
                        width: 100,
                        height: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15.0),
                                backgroundColor: Color(0xfff06292),
                                foregroundColor: Colors.white,
                                shape: StadiumBorder()),
                            onPressed: () {
                              Navigator.pushNamed(context, "/profile");
                            },
                            child: const Text(""))),
                    Padding(padding: EdgeInsets.only(top: 5.0))
                  ])),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  padding: const EdgeInsets.all(20.0),
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[Text("Nombre")],
                    ),
                    TextField(
                      focusNode: myfocus1,
                      style: const TextStyle(fontSize: 14),
                      controller: _nombreController,
                      decoration: InputDecoration(
                          hintText: '',
                          labelText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[Text("Apellidos")],
                    ),
                    TextField(
                      focusNode: myfocus2,
                      style: const TextStyle(fontSize: 14),
                      controller: _apellidosController,
                      decoration: InputDecoration(
                          hintText: '',
                          labelText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[Text("Contraseña")],
                    ),
                    TextField(
                      focusNode: myfocus3,
                      style: const TextStyle(fontSize: 14),
                      controller: _passController,
                      decoration: InputDecoration(
                          hintText: '',
                          labelText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Container(
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(15.0),
                                backgroundColor: Color(0xff3f51b5),
                                foregroundColor: Colors.white,
                                shape: StadiumBorder()),
                            onPressed: () {
                              Auth().update(
                                  _nombreController.text,
                                  _apellidosController.text,
                                  _passController.text);
                              Navigator.pushNamed(context, "/activities");
                            },
                            child: const Text("Editar")))
                  ]),
                )
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
