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
  String errorText = '';
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
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
  final _formKey = GlobalKey<FormState>();

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

  handleSubmit () async {
    if (!_formKey.currentState!.validate()) return;

    final nombre = _nombreController.text;
    final apellidos = _apellidosController.text;
    final pass = _passController.text;

    try {
      await Auth()
      .update(nombre, apellidos, pass)
      .then((_) => Navigator.pushNamed(context, "/activities"));
    } catch (e) {
      setState(() {
        errorText = 'Error al actualizar datos';
      });
    }
    
    
  }

  @override
  Widget build(BuildContext context) {

    obtenerPreguntas();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3949ab),
        toolbarHeight: 0,
      ),
      body: GestureDetector(
          onTap: () {
            myfocus1.unfocus();
            myfocus2.unfocus();
            myfocus3.unfocus();
            myfocus4.unfocus();
          },
          child: Container(
            constraints: const BoxConstraints.expand(),
            color: const Color(0xffe8eaf6),
            child: Column(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Nombre")],
                      ),
                      TextFormField(
                        focusNode: myfocus1,
                        style: const TextStyle(fontSize: 14),
                        controller: _nombreController,
                        decoration: InputDecoration(
                            hintText: '',
                            labelText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Llena este campo.';
                            }
                            return null;
                          }
                      ),
                      const Padding(padding: EdgeInsets.all(5.0)),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Apellidos")],
                      ),
                      TextFormField(
                        focusNode: myfocus2,
                        style: const TextStyle(fontSize: 14),
                        controller: _apellidosController,
                        decoration: InputDecoration(
                            hintText: '',
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Llena este campo.';
                            }
                            return null;
                          }
                      ),
                      const Padding(padding: EdgeInsets.all(5.0)),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Contraseña")],
                      ),
                      TextFormField(
                        focusNode: myfocus3,
                        style: const TextStyle(fontSize: 14),
                        controller: _passController,
                        decoration: InputDecoration(
                            hintText: '',
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Coloca una contraseña';
                          } else if (value.length < 6) {
                            return 'Debe tener al menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(5.0)),
                      Text(
                        errorText,
                        style: const TextStyle(color: Colors.red),
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
                              onPressed: () => handleSubmit(),
                              child: const Text("Editar")))
                    ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
