import 'package:feedbackapp/firebase/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  FocusNode myfocus1 = FocusNode();
  FocusNode myfocus2 = FocusNode();
  FocusNode myfocus3 = FocusNode();
  FocusNode myfocus4 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final usuario = _userController.text;
    final pass = _passController.text;
    final nombres = _nombreController.text;
    final apellidos = _apellidosController.text;

    await Auth()
        .registrarUsuario(usuario, pass, nombres, apellidos)
        .then((_) => Navigator.pushNamed(context, "/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3949ab),
        toolbarHeight: 0,
      ),
      resizeToAvoidBottomInset: true,
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
                  myfocus3.unfocus();
                  myfocus4.unfocus();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
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
                          decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Coloca una contraseña';
                            } else if (value.length < 6) {
                              return 'Debe tener al menos 6 caracteres';
                            }
                            return null;
                          }),
                      const Padding(padding: EdgeInsets.all(5.0)),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Nombre")],
                      ),
                      TextFormField(
                          focusNode: myfocus3,
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
                          }),
                      const Padding(padding: EdgeInsets.all(5.0)),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text("Apellidos")],
                      ),
                      TextFormField(
                          focusNode: myfocus4,
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
                          })
                    ]),
                  ),
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
                    onPressed: () => handleSubmit(),
                    child: const Text("Registrar"))),
            const Padding(padding: EdgeInsets.all(5.0)),
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
    );
  }
}
