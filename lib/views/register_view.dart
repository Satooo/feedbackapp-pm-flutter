import 'dart:convert';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _counter = 0;
  TextEditingController _userController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  FocusNode myfocus1 = FocusNode();
  FocusNode myfocus2 = FocusNode();
  FocusNode myfocus3 = FocusNode();
  FocusNode myfocus4 = FocusNode();

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

  @override
  Widget build(BuildContext context) {
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
      body: Center(
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
                  myfocus3.unfocus();
                  myfocus4.unfocus();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  padding: const EdgeInsets.all(20.0),
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[Text("Usuario")],
                    ),
                    TextField(
                      focusNode: myfocus1,
                      style: const TextStyle(fontSize: 10),
                      controller: _userController,
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
                      focusNode: myfocus2,
                      style: const TextStyle(fontSize: 10),
                      controller: _passController,
                      decoration: InputDecoration(
                          hintText: '',
                          labelText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[Text("Nombre")],
                    ),
                    TextField(
                      focusNode: myfocus2,
                      style: const TextStyle(fontSize: 10),
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
                      style: const TextStyle(fontSize: 10),
                      controller: _apellidosController,
                      decoration: InputDecoration(
                          hintText: '',
                          labelText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    )
                  ]),
                )),
            const Padding(padding: EdgeInsets.all(10.0)),
            Container(
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        backgroundColor: Color(0xff3f51b5),
                        foregroundColor: Colors.white,
                        shape: StadiumBorder()),
                    onPressed: () {
                      Navigator.pushNamed(context, "/activities");
                    },
                    child: const Text("Registrar"))),
            Padding(padding: EdgeInsets.all(20.0)),
            Container(
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        backgroundColor: Color(0xfff06292),
                        foregroundColor: Colors.white,
                        shape: StadiumBorder()),
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("Volver")))
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
