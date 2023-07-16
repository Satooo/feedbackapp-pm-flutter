import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registrarUsuario(
      String email, String password, String nombres, String apellidos) async {
    try {
      // Crear usuario en FirebaseAuth
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('usuarios').doc(user.uid).set(
            {'nombre': nombres, 'apellido': apellidos, 'password': password});
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al registrar el usuario: $e');
    }
  }

  Future<void> logearUsuario(String email, String password) async {
    // ignore: unused_local_variable
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error al logear el usuario: $e');
    }
  }

  Future<void> update(String name, String lastName, String password) async {
    // ignore: unused_local_variable
    try {
      final User? loggedUser = _auth.currentUser;
      if (loggedUser != null) {
        if (password.length >= 6) {
          loggedUser.updatePassword(password);
        }
        await _firestore.collection('usuarios').doc(loggedUser.uid).update(
            {'nombre': name, 'apellido': lastName, 'password': password});
      }
    } catch (e) {
      print('Error al modificar el usuario: $e');
    }
  }
}
