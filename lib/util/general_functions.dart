import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomLightColor() {
  Random random = Random();

  // Generate random RGB values ensuring they stay in the "light" range
  int red = random.nextInt(156) + 100; // Range: 100-255
  int green = random.nextInt(156) + 100; // Range: 100-255
  int blue = random.nextInt(156) + 100; // Range: 100-255

  return Color.fromARGB(255, red, green, blue);
}