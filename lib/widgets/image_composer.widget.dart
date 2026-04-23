import 'package:flutter/cupertino.dart';

class ImageComposer extends StatelessWidget {
  String src;
  double size;
  double? width;
  double? height;

  ImageComposer({
    super.key,
    required this.src,
    this.size = 200,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    if (width != null && height != null ){
      return Image.asset(src, width: width, height: height,);
    } else {
      return Image.asset(src, width: size, height: size,);
    }
  }
}