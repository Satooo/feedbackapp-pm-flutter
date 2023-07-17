import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registrarUsuario(
      String email, String password, String nombres, String apellidos) async {

      // Crear usuario en FirebaseAuth
      final UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('usuarios').doc(user.uid).set(
            {'nombre': nombres, 'apellido': apellidos, 'password': password});
      }
  }

  Future<void> logearUsuario(String email, String password) async {
    // ignore: unused_local_variable
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> update(String name, String lastName, String password) async {
    // ignore: unused_local_variable
      final User? loggedUser = _auth.currentUser;
      if (loggedUser != null) {

        await loggedUser.updatePassword(password);

        await _firestore.collection('usuarios').doc(loggedUser.uid).update(
            {'nombre': name, 'apellido': lastName, 'password': password});
      }
  }
}
