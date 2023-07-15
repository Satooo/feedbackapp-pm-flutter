import 'package:feedbackapp/views/activities_view.dart';
import 'package:feedbackapp/views/login_view.dart';
import 'package:feedbackapp/views/profile_view.dart';
import 'package:feedbackapp/views/rating_view.dart';
import 'package:feedbackapp/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ActivitiesPage();
            } else {
              return LoginPage(); 
            }
          }
        ),
        // '/': (context) => LoginPage(),
        '/activities': (context) => ActivitiesPage(),
        '/rating': (context) => RatingPage(),
        '/profile': (context) => ProfilePage(),
        '/register': (context) => RegisterPage()
      },
    ));
}
