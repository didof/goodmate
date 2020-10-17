import 'package:flutter/material.dart';

void allClear(Map<String, TextEditingController> textEditingController) {
  textEditingController.forEach((_, tex) => tex.clear());
}

Map<String, TextEditingController> buildMapOfTextEditingController(
    List<String> labels) {
  return Map.fromIterable(
    labels.map((element) => element),
    key: (element) => element,
    value: (e) => TextEditingController(),
  );
}
