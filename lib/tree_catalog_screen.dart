import 'package:fidanla_app/core/components/button_widget.dart';
import 'package:fidanla_app/core/components/dropdown_currency_button.dart';
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

  int selectedIndex = 0;

  @override
  void initState() {
    countryList = ["Ankara", "Antalya", "Yozgat", "Los Angeles"];
    ilceList = ["Çubuk", "Muratpaşa", "Çökelek", "Miami"];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katalog"),
      ),
      body: Column(
        children: [
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
                        image: AssetImage("assets/images/agac3.png"),
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("5 TANE 10 LİRA")),
                    ]),
                  ),
                  Container(
                    child: Column(children: [
                      Image(
                        image: AssetImage("assets/images/agac4.png"),
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("5 TANE 10 LİRA")),
                    ]),
                  ),
                  Container(
                    child: Column(children: [
                      Image(
                        image: AssetImage("assets/images/agac5.png"),
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("5 TANE 10 LİRA")),
                    ]),
                  ),
                ],
              )),
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
              onPressed: () {})
        ],
      ),
    );
  }
}
