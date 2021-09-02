import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String veritabaniAdi = "wallet.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);
    if (await databaseExists(veritabaniYolu)) {
      print("Database Already Have");
    } else {
      ByteData data = await rootBundle.load("Database/$veritabaniAdi");

      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Database Copied");
    }
    return openDatabase(veritabaniYolu);
  }
}
