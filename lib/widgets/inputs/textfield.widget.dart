
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String inputTittle;
  String placeholder;
  TextInputType type;
  TextEditingController? controller;
  Function(String)? onChange;

  Input({
    super.key,
    this.controller,
    this.inputTittle = "",
    this.placeholder = "",
    this.type = TextInputType.text,
    this.onChange
  });
  @override
  Widget build(BuildContext context) => TextField(
    autocorrect: true,
    controller: controller ?? TextEditingController(),
    onChanged: onChange,
    key: super.key,
    keyboardType: type,
    decoration: InputDecoration(
      filled: true,
      labelText: inputTittle,
      hintText: placeholder,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          ),
      focusColor: Theme.of(context).primaryColor,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20
      )
    ),
    style: TextStyle(fontSize: 20),
  );
}