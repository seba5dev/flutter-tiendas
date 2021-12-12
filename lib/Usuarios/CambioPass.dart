// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CambioPass extends StatefulWidget {
  @override
  CambioPassApp createState() => CambioPassApp();
}

//
class CambioPassApp extends State<CambioPass> {
  TextEditingController correo = TextEditingController();
  TextEditingController passA = TextEditingController();
  TextEditingController passN = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        int flag = 0;
        for (var cursor in usuario.docs) {
          if (cursor.get("Correo") == correo.text) {
            if (cursor.get("Password") == passA.text) {
              flag = 1;
              print(cursor.id);
              try {
                await firebase.collection("Usuarios").doc(cursor.id).set({
                  "nombreUsuario": cursor.get("nombreUsuario"),
                  "Correo": cursor.get("Correo"),
                  "Telefono": cursor.get("Telefono"),
                  "Password": passN.text,
                  "Estado": true
                });
              } catch (e) {
                print(e);
              }
            }
          }
        }
        if (flag == 0) {}
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
        title: const Text("Cambio de contraseña"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 50, right: 40, bottom: 0),
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
              padding: const EdgeInsets.only(
                  left: 40, top: 20, right: 40, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: passA,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Contraseña actual',
                  hintText: 'Digite su contraseña actual ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 20, right: 40, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: passN,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Contraseña nueva',
                  hintText: 'Digite su contraseña nueva',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 20, right: 40, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  validarDatos();
                  // correo.clear();
                  //pass.clear();
                },
                child: const Text("Cambiar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
