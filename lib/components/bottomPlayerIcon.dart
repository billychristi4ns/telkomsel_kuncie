import 'package:flutter/material.dart';

class BottomPlayerIcon extends StatelessWidget {
  final IconData icons;
  final Function onTap;
  const BottomPlayerIcon(this.icons,{this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTap,
            child: Icon(icons,size: 48,));
  }
}