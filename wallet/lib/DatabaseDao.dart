import 'package:wallet/DatabaseHelper.dart';
import 'package:wallet/Wallets.dart';

class DatabaseDao {
  Future<List<Wallets>> tumWallets() async {
    var db = await DatabaseHelper.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM wallet");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return Wallets(
        satir["wallet_id"],
        satir["wallet_bank_name"],
        satir["wallet_person_name"],
        satir["wallet_card_no"],
        satir["wallet_date"],
      );
    });
  }

  Future<void> ekle(String wallet_bank_name, String wallet_person_name,
      String wallet_card_no, String wallet_date) async {
    var db = await DatabaseHelper.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["wallet_bank_name"] = wallet_bank_name;
    bilgiler["wallet_person_name"] = wallet_person_name;
    bilgiler["wallet_card_no"] = wallet_card_no;
    bilgiler["wallet_date"] = wallet_date;

    await db.insert("wallet", bilgiler);
  }

  Future<void> sil(int wallet_id) async {
    var db = await DatabaseHelper.veritabaniErisim();

    await db.delete("wallet", where: "wallet_id = ?", whereArgs: [wallet_id]);
  }
}
