import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int _counter = 0;
  
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  FocusNode myfocus1 = FocusNode();
  FocusNode myfocus2 = FocusNode();
  String? fecha1P = '';
  String? fecha2P = '';
  String? fecha3P = '';
  String? fecha4P = '';

  Future<void> obtenerFechas () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fecha1 = prefs.getString("Proceso de solicitud");
    final String? fecha2 = prefs.getString("Proceso de seguro");
    final String? fecha3 = prefs.getString("Proceso de cancelación");
    final String? fecha4 = prefs.getString("Proceso de retiro");
    setState(() {
        fecha1P = fecha1;
        fecha2P = fecha2;
        fecha3P = fecha3;
        fecha4P = fecha4;
      });
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

  Widget fechaWidget (proceso) {
    if (proceso == "Proceso de solicitud") {
      return fecha1P==null ? Text('Modificado / $fecha1P') : Text('Modificado / $fecha1P');
    } else if (proceso == "Proceso de seguro") {
      return fecha2P==null ? Text('-') : Text('Modificado / $fecha2P');
    } else if (proceso == "Proceso de cancelación") {
      return fecha3P==null ? Text('-') : Text('Modificado / $fecha3P');
    } else {
      return fecha4P==null ? Text('-') : Text('Modificado / $fecha4P');
    }
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
                Container(
                  width: 300,
                  child: Column(
                        children: [
                          fechaWidget(activityName)
                        ],
                      )
                  ),
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
                          Navigator.pushNamed(context, "/rating", arguments: {
                            "id": activityId,
                            "name": activityName
                          });
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
    obtenerFechas();
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
                            FirebaseAuth.instance.signOut();
                            Navigator.pushNamed(context, "/");
                          },
                          child: const Text("Out"))),
                  Spacer(),
                  Container(
                      width: 50,
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
                  Padding(padding: EdgeInsets.only(right: 20.0))
                ],
              )),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: 350,
              child: const Expanded(
                  child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  "SampleBrand",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                Text(
                  "FeedbackApp",
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0))
              ])),
            ),
            Expanded(
                child:
                    ListView(scrollDirection: Axis.vertical, children: <Widget>[
              activityCard("Proceso de solicitud", 0),
              activityCard("Proceso de seguro", 0),
              activityCard("Proceso de cancelación", 0),
              activityCard("Proceso de retiro", 0),
              Padding(padding: EdgeInsets.only(bottom: 100.0))
            ]))
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
