import 'package:flutter/material.dart';

class DefaultScaffold extends Scaffold {
  Widget child;

  DefaultScaffold({
    required this.child
  });

  @override
  // TODO: implement body
  Widget? get body => Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/background.jpeg'), fit: BoxFit.cover, opacity: 0.1),
      ),
      child: child
    );
}