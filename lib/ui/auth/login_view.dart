import 'package:fidanla_app/core/components/button_widget.dart';
import 'package:fidanla_app/core/constants/assets_constants.dart';
import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/tabbar_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_safetynet_attestation/flutter_safetynet_attestation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var instance;
  final formKey2 = GlobalKey<FormState>();
  String email;
  String sifre;

  String _email;
  String _psw;

  @override
  void initState() {
    instance = FirebaseAuth.instance;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey2,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetConstanst.LOGIN_BACKGROUND_PATH))),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetConstanst.LOGIN_ICON_PATH),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "@example.com",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                  onSaved: (data) => email = data,
                  validator: (value) => null,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: "Sifre",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                  onSaved: (data) => sifre = data,
                  validator: (value) => null,
                ),
              ),
              SizedBox(height: 32),
              ButtonRegister(
                  bgColor: Color(0xFF6C7EBA).withOpacity(0.4),
                  icon: Icon(Icons.check),
                  onPressed: () => loginFirebase(),
                  labelText: Text("Giriş Yap"),
                  borderColor: Colors.white),
              GestureDetector(
                child: Text("Hesabım yok.."),
                onTap: () => Navigator.pop(context),
              )
            ],
          )
        ]),
      ),
    );
  }

  login() {
    if (formKey2.currentState.validate()) {
      formKey2.currentState.save();

      setState(() {
        _email = email;
        _psw = sifre;
      });
    }
  }

  loginFirebase() async {
    login();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _psw);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabbarRouter(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
