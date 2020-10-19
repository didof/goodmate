import 'package:crypto/crypto.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/collection_reference.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Features {
  final bool chat;
  final bool cleaningSchedule;
  final bool groceryShopping;
  const Features({this.chat, this.cleaningSchedule, this.groceryShopping});

  List<bool> get props => [chat, cleaningSchedule, groceryShopping];
}

class CreateFlatParameters {
  final String adminUid;
  final String flatName;
  final String secretKey;
  final String partyLength;
  final Features features;
  const CreateFlatParameters._({
    @required this.adminUid,
    @required this.flatName,
    @required this.secretKey,
    @required this.partyLength,
    @required this.features,
  });

  factory CreateFlatParameters({
    @required String adminUid,
    @required String flatName,
    @required String secretKey,
    @required String partyLength,
    @required List<bool> features,
  }) {
    return CreateFlatParameters._(
      adminUid: adminUid,
      flatName: flatName,
      secretKey: hashMd5(secretKey),
      partyLength: partyLength,
      features: transformFeatures(features),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adminUid': adminUid,
      'flatName': flatName,
      'secretKey': secretKey,
      'partyLength': partyLength,
      'features': _generateFeaturesMap(features.props),
    };
  }

  Map<String, String> _generateFeaturesMap(List<bool> list) {
    Map<String, String> map = {};
    if (list[0]) map.putIfAbsent('chat', () => ChatUid.generate().uid);
    if (list[1])
      map.putIfAbsent(
          'shopping_schedule', () => GroceryShoppingUid.generate().uid);
    if (list[2])
      map.putIfAbsent(
          'grocery_shopping', () => GroceryShoppingUid.generate().uid);
    return map;
  }
}

Features transformFeatures(List<bool> list) {
  return Features(
    chat: list[0],
    cleaningSchedule: list[1],
    groceryShopping: list[2],
  );
}

String hashMd5(String input) {
  var bytes = utf8.encode(input);
  return sha512.convert(bytes).toString();
}
