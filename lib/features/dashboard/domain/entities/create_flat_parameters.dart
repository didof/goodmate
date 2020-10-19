import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Features {
  final bool chat;
  final bool cleaningSchedule;
  final bool groceryShopping;
  const Features({this.chat, this.cleaningSchedule, this.groceryShopping});
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
