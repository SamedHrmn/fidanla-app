import 'package:flutter/material.dart';

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({
    Key key,
    @required this.bgColor,
    @required this.icon,
    @required this.labelText,
    @required this.borderColor,
    @required this.onPressed,
  }) : super(key: key);

  final Color bgColor;
  final Icon icon;
  final Text labelText;
  final Color borderColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        color: bgColor,
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0),
            side: BorderSide(color: borderColor)),
        icon: icon,
        label: labelText);
  }
}
