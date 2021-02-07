import 'package:fidanla_app/core/constants/assets_constants.dart';
import 'package:fidanla_app/ui/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                })
          ],
          title: Text("Profil"),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.grey[300],
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(AssetConstanst.LOGIN_ICON_PATH)),
                          )),
                      Text("TechnoVation"),
                      Text("Toplam dikim sayısı: 25"),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 45,
                      child: Card(
                        elevation: 8,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink,
                                ),
                                child: Center(child: Text(index.toString()))),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Sana fidan aldım"),
                            Spacer(),
                            Text("20/04/2021"),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
          ],
        ));
  }
}
