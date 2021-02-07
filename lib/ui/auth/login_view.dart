import 'package:fidanla_app/core/components/button_widget.dart';
import 'package:fidanla_app/core/constants/assets_constants.dart';
import 'package:fidanla_app/tabbar_router.dart';
import 'package:fidanla_app/ui/auth/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          buildBackgroundContainer(context),
          Column(
            children: [
              buildIconContainer(),
              SizedBox(
                height: 50,
              ),
              buildEmailTextFormField(),
              SizedBox(
                height: 16,
              ),
              buildSifreTextFormField(),
              SizedBox(height: 32),
              buildLoginButton(),
              buildRegisterPageRouteButton(context)
            ],
          )
        ]),
      ),
    );
  }

  GestureDetector buildRegisterPageRouteButton(BuildContext context) {
    return GestureDetector(
        child: Text("Hesabım yok.."),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            )));
  }

  CustomButton buildLoginButton() {
    return CustomButton(
        bgColor: Color(0xFF6C7EBA).withOpacity(0.4),
        icon: Icon(Icons.check),
        onPressed: () => loginFirebase(),
        labelText: Text("Giriş Yap"),
        borderColor: Colors.white);
  }

  Container buildSifreTextFormField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Sifre",
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 2, color: Colors.white))),
        onSaved: (data) => sifre = data,
        validator: (value) => null,
      ),
    );
  }

  Container buildEmailTextFormField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle(color: Colors.white),
            hintText: "@example.com",
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 2, color: Colors.white))),
        onSaved: (data) => email = data,
        validator: (value) => null,
      ),
    );
  }

  Container buildIconContainer() {
    return Container(
      margin: EdgeInsets.only(top: 65),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetConstanst.LOGIN_ICON_PATH),
              fit: BoxFit.cover)),
    );
  }

  Container buildBackgroundContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetConstanst.LOGIN_BACKGROUND_PATH),
              fit: BoxFit.fill)),
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
