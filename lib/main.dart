import 'package:fidanla_app/ui/auth/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /* final _firebaseReferance = FirebaseDatabase().reference().child("trees");
  String name = "Kavak";
  String price = "10";
  String img =
      "https://firebasestorage.googleapis.com/v0/b/fidanla-app.appspot.com/o/agac4.png?alt=media&token=2554f70c-ac1a-4e90-98aa-e67e656601c6";

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
