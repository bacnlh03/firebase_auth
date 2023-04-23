import 'package:flutter/material.dart';

class AddSpace {
  AddSpace._();

  static Widget horizontal(double size) {
    return SizedBox(
      width: size,
    );
  }

  static Widget vertical(double size) {
    return SizedBox(
      height: size,
    );
  }
}