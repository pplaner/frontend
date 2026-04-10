import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

abstract class EncryptionService {
  Future<Uint8List> encrypt(Uint8List data, Uint8List key);
  Future<Uint8List> decrypt(Uint8List data, Uint8List key);
}

extension StringEncryption on EncryptionService {
  Future<Uint8List> encryptString(String text, Uint8List key) {
    final bytes = utf8.encode(text);
    return encrypt(bytes, key);
  }

  Future<String> decryptString(Uint8List data, Uint8List key) async {
    final decryptedBytes = await decrypt(data, key);
    return utf8.decode(decryptedBytes);
  }
}

class AesGcmService implements EncryptionService {
  final _algorithm = AesGcm.with256bits();

  @override
  Future<Uint8List> encrypt(Uint8List data, Uint8List key) async {
    final secretKey = SecretKey(key);

    final secretBox = await _algorithm.encrypt(data, secretKey: secretKey);

    final encryptedData = secretBox.concatenation();

    return encryptedData;
  }

  @override
  Future<Uint8List> decrypt(Uint8List data, Uint8List key) async {
    final secretKey = SecretKey(key);

    final secretBox = SecretBox.fromConcatenation(
      data,
      nonceLength: 12,
      macLength: 16,
    );

    final decryptedData = await _algorithm.decrypt(
      secretBox,
      secretKey: secretKey,
    );

    return Uint8List.fromList(decryptedData);
  }
}
