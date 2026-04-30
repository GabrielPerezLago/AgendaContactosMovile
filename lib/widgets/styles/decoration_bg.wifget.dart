import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecorationBackground{
  double opacity;

  DecorationBackground({
    this.opacity = 0.2
});


  DecorationImage decoration(BuildContext context) => DecorationImage(image: Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/background_light.jpeg') : AssetImage('assets/images/background_dark.jpeg'), fit: BoxFit.cover, opacity: opacity);
}