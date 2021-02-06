import 'package:fidanla_app/core/components/button_widget.dart';
import 'package:fidanla_app/core/constants/assets_constants.dart';
import 'package:fidanla_app/ui/auth/login_view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: Stack(children: [
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
                        borderSide: BorderSide(width: 2, color: Colors.white))),
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
                        borderSide: BorderSide(width: 2, color: Colors.white))),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Telefon",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "(0555)-555-55-55",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(width: 2, color: Colors.white))),
              ),
            ),
            SizedBox(height: 32),
            ButtonRegister(
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
    );
  }
}
