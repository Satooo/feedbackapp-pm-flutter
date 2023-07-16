import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidosController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                hintText: 'Ingrese su nombre',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Apellidos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _apellidosController,
              decoration: const InputDecoration(
                hintText: 'Ingrese sus apellidos',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contraseña',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(
                hintText: 'Ingrese su contraseña',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Guardar los cambios en el perfil
                String nombre = _nombreController.text;
                String apellidos = _apellidosController.text;
                String contrasena = _passController.text;
                String mensaje = 'Nombre: $nombre\nApellidos: $apellidos\nContraseña: $contrasena';
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Perfil Actualizado'),
                      content: Text(mensaje),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
