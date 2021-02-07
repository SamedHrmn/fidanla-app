import 'package:date_format/date_format.dart';
import 'package:fidanla_app/core/constants/assets_constants.dart';
import 'package:fidanla_app/ui/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _userReferance = FirebaseDatabase()
      .reference()
      .child("users")
      .child(FirebaseAuth.instance.currentUser.uid);
  DatabaseReference _treesReferance;

  Map<dynamic, dynamic> dataMap;
  int selectedIndex = 0;
  String dikilenAgacCount;
  String kullaniciAdi;
  List userList;

  @override
  void initState() {
    _treesReferance = _userReferance.child("trees");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFF6C7EBA), Color(0xFFD1AC9)])),
          ),
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
        body: StreamBuilder(
          stream: _userReferance.onValue,
          builder: (context, _snap) {
            if (_snap.hasData &&
                !_snap.hasError &&
                _snap.data.snapshot.value != null) {
              Map data = _snap.data.snapshot.value;

              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(16)),
                              margin: EdgeInsets.only(left: 24),
                              child: Column(
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(AssetConstanst
                                                .LOGIN_ICON_PATH)),
                                      )),
                                  Text("Kullanıcı : " + data["username"]),
                                  Text("Toplam dikim sayısı: " +
                                      data["user_tree_count"]),
                                ],
                              ),
                            ),
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
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: StreamBuilder(
                        stream: _treesReferance.onValue,
                        builder: (context, AsyncSnapshot<Event> snapshot) {
                          if (snapshot.hasData &&
                              !snapshot.hasError &&
                              snapshot.data.snapshot.value != null) {
                            Map treedata = snapshot.data.snapshot.value;
                            List treeitem = [];

                            treedata.forEach((index, data) =>
                                treeitem.add({"timestamp": index, ...data}));

                            return ListView.builder(
                              itemCount: treeitem.length,
                              itemBuilder: (context, treeindex) {
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xFF6C7EBA),
                                            ),
                                            child: Center(
                                                child: Text(
                                              treeindex.toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Türü ${treeitem[treeindex]['tree_name']} olan fidan alındı",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Spacer(),
                                        Text(
                                          formatDate(
                                              (DateTime
                                                  .fromMicrosecondsSinceEpoch(
                                                      treeitem[treeindex]
                                                              ['timestamp'] *
                                                          1000)),
                                              [yyyy, '-', mm, '-', dd]),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  )),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
