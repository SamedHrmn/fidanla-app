import 'package:fidanla_app/ui/auth/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*final _firebaseReferance = FirebaseDatabase().reference().child("trees");
  String name = "Cinar";
  String price = "15";
  String img =
      "https://firebasestorage.googleapis.com/v0/b/fidanla-app.appspot.com/o/agac3.png?alt=media&token=276cde43-a4af-4f64-90da-2b368b88608d";

  _firebaseReferance.push().set({
    "tree_name": name,
    "tree_price": price,
    "tree_image": img
    //"timestamp": DateTime.now().millisecondsSinceEpoch
  });*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
