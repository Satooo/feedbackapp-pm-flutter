import 'package:feedbackapp/views/activities_view.dart';
import 'package:feedbackapp/views/login_view.dart';
import 'package:feedbackapp/views/profile_view.dart';
import 'package:feedbackapp/views/rating_view.dart';
import 'package:feedbackapp/views/register_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/activities': (context) => ActivitiesPage(),
        '/rating': (context) => RatingPage(),
        '/profile': (context) => ProfilePage(),
        '/register': (context) => RegisterPage()
      },
    ));
