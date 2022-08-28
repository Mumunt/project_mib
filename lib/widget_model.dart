import 'package:flutter/material.dart' show IconData, Color;

typedef OnTapButton = void Function();

class ButtonData {
  String? text;
  IconData? iconButton;
  OnTapButton? onTap;
  Color color;
  double? width;
  bool useExpanded;

  ButtonData({
    this.text,
    this.iconButton,
    this.onTap,
    required this.color,
    this.width,
    this.useExpanded = false,
  });
}
