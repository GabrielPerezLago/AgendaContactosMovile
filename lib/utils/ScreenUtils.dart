import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenUtils {

  void Router(BuildContext context, Widget state) => Navigator.push(context, MaterialPageRoute(builder:  (_) => state));
  void RouterReplace(BuildContext context, Widget state) => Navigator.pushReplacement(context, MaterialPageRoute(builder:  (_) => state));

}