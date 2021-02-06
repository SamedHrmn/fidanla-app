import 'package:flutter/material.dart';

class DropdownCurrencyButton extends StatelessWidget {
  const DropdownCurrencyButton({
    Key key,
    @required this.currencyBase,
    this.callback,
    this.selectedVal,
    this.mainAxisAlignment,
  }) : super(key: key);

  final List<String> currencyBase;
  final Function callback;
  final String selectedVal;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: Colors.grey[200],
        items: currencyBase.map((value) {
          return DropdownMenuItem<String>(child: Text(value), value: value);
        }).toList(),
        onChanged: (item) {
          callback(item);
        },
        value: selectedVal,
      ),
    );
  }
}
