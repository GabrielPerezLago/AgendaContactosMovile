import 'package:agenda_contactos/widgets/images_composers/image_composer.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenUtils {

  void Enrouter(BuildContext context, Widget state) => Navigator.push(context, MaterialPageRoute(builder:  (_) => state));
  void EnrouterReplace(BuildContext context, Widget state) => Navigator.pushReplacement(context, MaterialPageRoute(builder:  (_) => state));
  ImageComposer LogoInit(BuildContext context, double width, double height) => ImageComposer(
    src: Theme.of(context).brightness == Brightness.light ? "assets/images/logo_light.png" : "assets/images/logo_dark.png",
    width: width,
    height: height,
  );
}