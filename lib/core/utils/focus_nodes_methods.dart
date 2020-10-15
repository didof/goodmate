import 'package:flutter/material.dart';

void allLooseFocus(Map<String, FocusNode> focusNodes) {
  focusNodes.forEach((_, node) => node.unfocus());
}

void requestFocus(FocusNode focusNode) {
  focusNode.requestFocus();
}

Map<String, FocusNode> buildMapOfFocusNodes(List<String> labels) {
  return Map.fromIterable(
    labels.map((element) => element),
    key: (element) => element,
    value: (e) => FocusNode(),
  );
}
