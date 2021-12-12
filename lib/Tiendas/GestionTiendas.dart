// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'ShopRegister.dart';
import 'Shop.dart';
import '../buscar.dart';

class GestionTiendas extends StatefulWidget {
  @override
  GestionTiendasApp createState() => GestionTiendasApp();
}

//
class GestionTiendasApp extends State<GestionTiendas> {
  TextEditingController busqueda = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión Tiendas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ShopRegister()));
                  },
                  child: const Text("Registro de tienda"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 50)),
                  onPressed: () {},
                  child: const Text("Modificar tienda"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 50)),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Shop()));
                  },
                  child: const Text("Listado de tiendas"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: busqueda,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Buscar tienda',
                  hintText: 'Digite palabra clave de la tienda',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(500, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => buscar(busqueda.text)));
                },
                child: const Text("Buscar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
