// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Token {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  guardarToken(String idUser) async {
    String? isToken;
    await Firebase.initializeApp();
    isToken = await FirebaseMessaging.instance.getToken();
    print(isToken);

    try {
      await firestore.collection("Tokens").doc().set(
        {
          "TokenId": isToken,
          "UserId": idUser,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future validarToken(String x) async {
    String isSession = "vacio";
    String? isToken = "";
    String idToken = "";
    try {
      await Firebase.initializeApp();
      isToken = await FirebaseMessaging.instance.getToken();

      CollectionReference ref = FirebaseFirestore.instance.collection("Tokens");
      QuerySnapshot token = await ref.get();

      if (token.docs.length != 0) {
        int flag = 0;
        for (var cursor in token.docs) {
          if (cursor.get("TokenId").toString() == isToken.toString()) {
            isSession = cursor.get("UserId");
            idToken = cursor.id;
            print("Sesion....." + isSession);
          }
        }
        print(flag);
        if (flag == 0) {}
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
      print(e);
    }

    if (x == "Login") {
      return idToken;
    } else {
      return isSession;
    }
  }
}
