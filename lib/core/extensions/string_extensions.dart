import 'dart:convert';

import 'package:crypto/crypto.dart';

extension StringExtensions on String {
  String hashSHA256() {
    return sha256.convert(utf8.encode(this)).toString();
  }
}
