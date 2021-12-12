// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'RegistroUser.dart';
import 'Login.dart';
import 'CambioPass.dart';
import 'ModificarUsuario.dart';

class GestionUsuario extends StatefulWidget {
  @override
  GestionUsuarioApp createState() => GestionUsuarioApp();
}

//
class GestionUsuarioApp extends State<GestionUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion Usuario"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistroUser()));
                },
                child: const Text("Registro de usuario"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CambioPass()));
                },
                child: const Text("Cambio de contraseña"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  mensaje("Inactivar Usuario", "¿Desea inactivar al usuario?");
                },
                child: const Text("Dar de baja"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ModificarUsuario()));
                },
                child: const Text("modificar de usuario"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Correo',
                    hintText: 'Digite el correo',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Contraseña',
                    hintText: 'Digite Contraseña',
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar",
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar",
                    style: TextStyle(color: Colors.blueGrey)),
              ),
            ],
          );
        });
  }
}
