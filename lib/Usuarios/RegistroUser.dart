// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroUser extends StatefulWidget {
  @override
  RegistroUserApp createState() => RegistroUserApp();
}

//
class RegistroUserApp extends State<RegistroUser> {
  @override
  TextEditingController nombreUser = TextEditingController();
  TextEditingController Correo = TextEditingController();
  TextEditingController tele = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController direccion = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registrarUsuario() async {
    try {
      await firebase.collection("Usuarios").doc().set({
        "nombreUsuario": nombreUser.text,
        "Correo": Correo.text,
        "Telefono": tele.text,
        "Password": pass.text,
        "Direccion": direccion.text,
        "Estado": true
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Regisgtro de Usuario"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: nombreUser,
                  decoration: InputDecoration(
                    labelText: "Nombre usuario",
                    hintText: "Digite nombre del usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: Correo,
                  decoration: InputDecoration(
                      labelText: "Correo",
                      hintText: "Digite correo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: tele,
                  decoration: InputDecoration(
                      labelText: "Tel??fono",
                      hintText: "Digite tel??fono",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  controller: direccion,
                  decoration: InputDecoration(
                      labelText: "Direccion",
                      hintText: "Digite Direcci??n",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  controller: pass,
                  decoration: InputDecoration(
                      labelText: "Contrase??a",
                      hintText: "Digite contrase??a",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 15, right: 15, bottom: 0),
                  child: ElevatedButton(
                    onPressed: () {
                      registrarUsuario();
                      nombreUser.clear();
                      Correo.clear();
                      tele.clear();
                      pass.clear();
                      direccion.clear();
                    },
                    child: const Text("Registrar"),
                  )),
            ],
          ),
        ));
  }
}
