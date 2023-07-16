import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class RatingPage extends StatefulWidget {
  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _counter = 0;
  TextEditingController _comment = TextEditingController();
  TextEditingController _passController = TextEditingController();
  FocusNode myfocus1 = FocusNode();
  FocusNode myfocus2 = FocusNode();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var updated = false;

  var preguntas = [];

  var puntaje = [-1, -1, -1];

  Future<void> obtenerPreguntas() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('preguntas')
          .doc("WHhBNB0RkCi47NrgRGIv")
          .get();
      final array = doc.data()!['lista'];
      preguntas = array;
      if (updated == false) {
        setState(() {});
      }
      updated = true;
    } catch (e) {
      debugPrint("Error obteniendo preguntas");
    }
  }

  Future<void> ingresarCalificacion(proceso) async {
    try {
      var uuid = UniqueKey().hashCode.toInt();
      await _firestore
          .collection('calificacion')
          .doc(uuid.toString() + proceso)
          .set({
        'proceso': proceso,
        'usuario': FirebaseAuth.instance.currentUser!.uid,
        'rapidez': puntaje[0],
        'efectividad': puntaje[1],
        'amabilidad': puntaje[2],
        'comentario': _comment.text
      });
      Navigator.pushNamed(context, "/");
    } catch (e) {
      print("Error ingresando");
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter < 3) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      puntaje[_counter] = -1;
    });
  }

  activityCard(activityName, activityId) {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(20.0),
          width: 350,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              preguntas.length > 0 ? preguntas[_counter] : "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text("Aprete el botón que corresponda"),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Color(0xffe53935),
                            foregroundColor: Colors.white,
                            elevation: (puntaje[_counter] > 0) ? 20 : 0,
                            shape: StadiumBorder()),
                        onPressed: () {
                          puntaje[_counter] = 1;
                          _incrementCounter();
                        },
                        child: const Text(""))),
                Spacer(),
                Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Color(0xfffb8c00),
                            foregroundColor: Colors.white,
                            elevation: (puntaje[_counter] > 0) ? 20 : 0,
                            shape: StadiumBorder()),
                        onPressed: () {
                          puntaje[_counter] = 2;
                          _incrementCounter();
                        },
                        child: const Text(""))),
                Spacer(),
                Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Color(0xffffd54f),
                            foregroundColor: Colors.white,
                            elevation: (puntaje[_counter] > 0) ? 20 : 0,
                            shape: StadiumBorder()),
                        onPressed: () {
                          puntaje[_counter] = 3;
                          _incrementCounter();
                        },
                        child: const Text(""))),
                Spacer(),
                Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Color(0xff9ccc65),
                            foregroundColor: Colors.white,
                            elevation: (puntaje[_counter] > 0) ? 20 : 0,
                            shape: StadiumBorder()),
                        onPressed: () {
                          puntaje[_counter] = 4;
                          _incrementCounter();
                        },
                        child: const Text(""))),
                Spacer(),
                Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            backgroundColor: Color(0xff43a047),
                            foregroundColor: Colors.white,
                            elevation: (_counter == 5) ? 20 : 0,
                            shape: StadiumBorder()),
                        onPressed: () {
                          puntaje[_counter] = 5;
                          _incrementCounter();
                        },
                        child: const Text("")))
              ],
            )
          ]),
        )
      ]),
    );
  }

  commentCard() {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(20.0),
          width: 350,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              "Si desea, puede ingresar un comentario describiendo la atención",
              style: TextStyle(fontSize: 15.0),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 2,
              maxLines: null,
              focusNode: myfocus1,
              style: const TextStyle(fontSize: 12),
              controller: _comment,
              decoration: InputDecoration(
                  hintText: '',
                  labelText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            )
          ]),
        )
      ]),
    );
  }

  cardSwitcher() {
    if (_counter >= 0 && _counter < 3) {
      return activityCard("", "0");
    } else {
      return commentCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
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
          onTap: () => {myfocus1.unfocus()},
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
                                  backgroundColor: Color(0xfff8bbd0),
                                  foregroundColor: Colors.black,
                                  shape: StadiumBorder()),
                              onPressed: () {
                                Navigator.pushNamed(context, "/");
                              },
                              child: const Text("Volver"))),
                      Spacer(),
                      Container(
                          width: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15.0),
                                  backgroundColor: Color(0xffec407a),
                                  foregroundColor: Colors.black,
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
                  child: Expanded(
                      child: Column(children: [
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      arg['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0))
                  ])),
                ),
                cardSwitcher(),
                Padding(padding: EdgeInsets.only(bottom: 20.0)),
                Container(
                  width: 250,
                  child: Row(
                    children: [
                      Container(
                          width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15.0),
                                  backgroundColor: Color(0xff3f51b5),
                                  foregroundColor: Colors.white,
                                  shape: StadiumBorder()),
                              onPressed: () {
                                //Navigator.pushNamed(context, "/");
                                if (_counter > 0) {
                                  _decrementCounter();
                                }
                              },
                              child: const Text("Atras"))),
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
                                //Navigator.pushNamed(context, "/");
                                if (_counter == 3) {
                                  ingresarCalificacion(arg['name']);
                                } else {
                                  _incrementCounter();
                                }
                              },
                              child: const Text("Continuar")))
                    ],
                  ),
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
