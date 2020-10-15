import 'package:flutter/material.dart';

extension StringMethods on String {
  String selectStrBefore(String cuttingPoint) {
    return this.substring(0, this.indexOf(cuttingPoint));
  }

  String capitalizeFirstLetter() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

extension ListMethods on List {
  void execAll() {
    final List<Function> executable =
        this.where((element) => element is Function).toList();
    executable.forEach((element) => element());
  }
}
