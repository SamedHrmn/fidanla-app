import 'package:fidanla_app/core/components/button_widget.dart';
import 'package:fidanla_app/core/constants/assets_constants.dart';
import 'package:fidanla_app/home_screen.dart';
import 'package:fidanla_app/tabbar_router.dart';
import 'package:fidanla_app/ui/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firebaseReferance = FirebaseDatabase().reference().child("users");
  final formKey = GlobalKey<FormState>();
  String isimSoyisim;
  String email;
  String telefon;
  String sifre;

  String _name;
  String _email;
  String _phone;
  String _psw;

  @override
  void initState() {
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
        key: formKey,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetConstanst.LOGIN_BACKGROUND_PATH),
                    fit: BoxFit.fill)),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 65),
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Ad Soyad",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "Ad Soyad",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                  onSaved: (data) => isimSoyisim = data,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16,
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
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Sifre",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                  onSaved: (data) => sifre = data,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Telefon",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "(0555)-555-55-55",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                  onSaved: (data) => telefon = data,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              SizedBox(height: 32),
              ButtonRegister(
                  onPressed: saveToFirebase,
                  bgColor: Color(0xFF6C7EBA).withOpacity(0.4),
                  icon: Icon(Icons.check),
                  labelText: Text("Kaydol"),
                  borderColor: Colors.white),
              GestureDetector(
                child: Text("Zaten üyeyim.."),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }

  saveToFirebase() async {
    register();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _psw);

      _firebaseReferance.child(userCredential.user.uid).set({
        "username": _name,
        "email": _email,
        "password": _psw,
        "phonenumber": _phone,
        "user_tree_count": "0",
        "timestamp": DateTime.now().millisecondsSinceEpoch
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabbarRouter(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    //Firebase İşlemleri

    // print("YAZDIM");
  }

  register() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      setState(() {
        _name = isimSoyisim;
        _email = email;
        _phone = telefon;
        _psw = sifre;
      });
    }
  }
}
