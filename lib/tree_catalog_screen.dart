import 'package:fidanla_app/core/components/button_widget.dart';
import 'package:fidanla_app/core/components/dropdown_currency_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TreeCatalogScreen extends StatefulWidget {
  @override
  _TreeCatalogScreenState createState() => _TreeCatalogScreenState();
}

class _TreeCatalogScreenState extends State<TreeCatalogScreen> {
  List<String> countryList;
  List<String> ilceList;
  String selectedCountry = "Ankara";
  String selectedIlce = "Çubuk";
  List treeItem = [];
  int pageIndex = 0;
  int count = 0;

  final _firebaseReferance = FirebaseDatabase().reference().child("trees");
  DatabaseReference _referenceBuying;

  @override
  void initState() {
    countryList = ["Ankara", "Antalya", "Yozgat", "Los Angeles"];
    ilceList = ["Çubuk", "Muratpaşa", "Çökelek", "Miami"];

    final uuid = FirebaseAuth.instance.currentUser.uid;
    _referenceBuying =
        FirebaseDatabase().reference().child("users").child(uuid);

    super.initState();
  }

  Function dropDownCountryCallback(String value) {
    setState(() {
      selectedCountry = value;
    });
  }

  Function dropDownIlceCallback(String value) {
    setState(() {
      selectedIlce = value;
    });
  }

  Function pageIndexCallback(int val) {
    setState(() {
      pageIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katalog"),
      ),
      body: StreamBuilder(
        stream: _firebaseReferance.onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            Map data = snap.data.snapshot.value;

            data.forEach(
                (index, data) => treeItem.add({"tree_image": index, ...data}));

            return Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: PageView.builder(
                  onPageChanged: (value) => pageIndexCallback(value),
                  itemCount: treeItem.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          margin: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(width: 1, color: Colors.blue)),
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: PageView(
                            children: [
                              Container(
                                child: Column(children: [
                                  Image(
                                    image: NetworkImage(treeItem[index]
                                            ["tree_image"]
                                        .toString()),
                                    width: 200,
                                    height: 200,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Ağaç türü: " +
                                              treeItem[index]["tree_name"]
                                                  .toString()),
                                          Text("Fiyat:" +
                                              treeItem[index]["tree_price"] +
                                              "\$"),
                                        ],
                                      )),
                                ]),
                              ),
                            ],
                          )),
                    ]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownCurrencyButton(
                      currencyBase: countryList,
                      selectedVal: selectedCountry,
                      callback: dropDownCountryCallback,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownCurrencyButton(
                      currencyBase: ilceList,
                      selectedVal: selectedIlce,
                      callback: dropDownIlceCallback,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              ButtonRegister(
                bgColor: Color(0xFF6C7EBA),
                icon: Icon(Icons.shopping_basket),
                labelText: Text("Ödemeye git"),
                borderColor: Colors.white,
                onPressed: () => saveShopInfoFirebase(),
              ),
            ]);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  saveShopInfoFirebase() {
    String tree_name;
    String tree_price;
    String tree_country;
    String tree_ilce;

    tree_name = treeItem[pageIndex]["tree_name"];
    tree_price = treeItem[pageIndex]["tree_price"];
    tree_country = selectedCountry;
    tree_ilce = selectedIlce;

    _referenceBuying.child("trees").push().set({
      "tree_name": tree_name,
      "tree_price": tree_price,
      "tree_country": tree_country,
      "tree_ilce": tree_ilce,
      "timestamp": DateTime.now().millisecondsSinceEpoch
    });
    count++;
  }
}
