import 'package:flutter/material.dart';

class CarouselSliderItem {
  final String iconPath;
  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback action;
  final bool isButtonVisible;
  final List gradientColors;

  CarouselSliderItem({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.action,
    required this.isButtonVisible,
    required this.gradientColors,
  });
}
