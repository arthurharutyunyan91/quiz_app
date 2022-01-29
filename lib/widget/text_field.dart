import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String labelText;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;

  CustomTextForm(
      {this.controller,
      this.validator,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        style: TextStyle(fontSize: 13),
        decoration: getTextFieldDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
      ),
    );
  }
}

getTextFieldDecoration(
    {@required String labelText, Widget prefixIcon, Widget suffixIcon}) {
  return InputDecoration(
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Color(0xff7069DB), width: 0.5)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Color(0xffDACAFB), width: 0.5)),
    // errorBorder: UnderlineInputBorder(),
  );
}
