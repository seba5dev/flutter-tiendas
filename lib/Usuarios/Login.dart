// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../buscar.dart';
import 'Token.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

//
class LoginApp extends State<Login> {
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          print(cursor.get("Correo") + "||" + correo.text);

          if (cursor.get("Correo") == correo.text) {
            print(cursor.get("Password"));
            if (cursor.get("Password") == pass.text) {
              print(cursor.get("nombreUsuario"));
              flag = 1;
              Token tk = Token();
              String idToken = await tk.validarToken("Login");
              if (idToken != 0) {
                final firebase = FirebaseFirestore.instance;
                try {
                  firebase.collection("Tokens").doc(idToken).delete();
                } catch (e) {
                  print(e);
                }
              }
              tk.guardarToken(cursor.id.toString());
              Navigator.of(context).pop();
            }
          }
        }
        print(flag);
        if (flag == 0) {
          mensaje("No encotrado", "No se encontró el usuario");
        }
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingreso de clientes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('image/login.png'),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Correo',
                  hintText: 'Digite el correo',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Contraseña',
                  hintText: 'Digite su contraseña',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  validarDatos();
                  // correo.clear();
                  //pass.clear();
                },
                child: const Text("Enviar"),
              ),
            ),
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
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar",
                    style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
