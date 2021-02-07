import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firebaseReferance = FirebaseDatabase().reference().child("users");

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
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: _firebaseReferance.onValue,
          builder: (context, snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value != null) {
              Map data = snap.data.snapshot.value;
              List item = [];

              data.forEach(
                  (index, data) => item.add({"email": index, ...data}));

              return ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(item[index]['email']),
                    trailing: Text(formatDate(
                        (DateTime.fromMicrosecondsSinceEpoch(
                            item[index]['timestamp'] * 1000)),
                        [yyyy, '-', mm, '-', dd])),
                  );
                },
              );
            } else
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.now_widgets_outlined,
                        size: 100,
                      ),
                      Text("Henüz kayıtlı veri yok.")
                    ]),
              );
          },
        ),
      ),
    );
  }
}
