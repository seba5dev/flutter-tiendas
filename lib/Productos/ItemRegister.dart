// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemRegister extends StatefulWidget {
  final String idTienda;
  const ItemRegister(this.idTienda);

  @override
  ItemRegisterApp createState() => ItemRegisterApp();
}

class ItemRegisterApp extends State<ItemRegister> {
  @override
  TextEditingController nombre = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registrarProducto() async {
    try {
      await firebase.collection("Productos").doc().set({
        "Nombre": nombre.text,
        "Precio": double.parse(precio.text),
        "Descripcion": descripcion.text,
        "TiendaId": widget.idTienda,
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
                  controller: nombre,
                  decoration: InputDecoration(
                    labelText: "Nombre Producto",
                    hintText: "Digite nombre del producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: precio,
                  decoration: InputDecoration(
                      labelText: "Precio final",
                      hintText: "Digite precio",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: descripcion,
                  decoration: InputDecoration(
                      labelText: "Descripción",
                      hintText: "Digite Descripción del producto",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 15, right: 15, bottom: 0),
                  child: ElevatedButton(
                    onPressed: () {
                      registrarProducto();
                      nombre.clear();
                      precio.clear();
                      descripcion.clear();
                    },
                    child: const Text("Registrar"),
                  )),
            ],
          ),
        ));
  }
}
