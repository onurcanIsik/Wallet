import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/DatabaseDao.dart';
import 'package:wallet/DatabaseHelper.dart';
import 'package:wallet/infoPPage.dart';

import 'Wallets.dart';

void main() {
  runApp(
    DarkLightTheme(),
  );
}

class DarkLightTheme extends StatelessWidget {
  const DarkLightTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tfBankName = TextEditingController();
  var tfCardNo = TextEditingController();
  var tfNameController = TextEditingController();
  var tfdateController = TextEditingController();

  String bankInput = "";
  String cardInput = "";
  String nameInput = "";
  String dateInput = "";

  Future<List<Wallets>> tumWallets() async {
    var walletList = await DatabaseDao().tumWallets();

    return walletList;
  }

  Future<void> ekle(String wallet_bank_name, String wallet_person_name,
      String wallet_card_no, String wallet_date) async {
    await DatabaseDao().ekle(
        wallet_bank_name, wallet_person_name, wallet_card_no, wallet_date);
  }

  Future<void> sil(int wallet_id) async {
    await DatabaseDao().sil(wallet_id);
  }

  ThemeData lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  ThemeData darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  bool light = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light ? lightTheme : darkTheme,
        home: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white70,
              elevation: 5,
              child: Switch(
                activeColor: Colors.indigo,
                inactiveThumbColor: Colors.amber,
                inactiveTrackColor: Colors.black,
                activeTrackColor: Colors.black,
                value: light,
                onChanged: (state) {
                  setState(() {
                    light = state;
                  });
                },
              ),
              onPressed: () {},
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 50,
            child: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.white70,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InfoPage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.credit_card,
                      color: Colors.white70,
                      size: 35,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              title: Text("Add Wallet"),
                              elevation: 5,
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextField(
                                      onChanged: (String index) {
                                        bankInput = index;
                                      },
                                      controller: tfBankName,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        labelText: "Banka Adı",
                                        labelStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text("Örn: 0000-0000-0000-0000"),
                                    TextField(
                                      onChanged: (String index) {
                                        cardInput = index;
                                      },
                                      controller: tfCardNo,
                                      style: TextStyle(fontSize: 18),
                                      maxLength: 19,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        labelText: "Kart Numaranız",
                                        labelStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      onChanged: (String index) {
                                        nameInput = index;
                                      },
                                      controller: tfNameController,
                                      maxLength: 20,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        labelText: "Kart Sahibinin Adı",
                                        labelStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                    Text("Örn : 05/24"),
                                    TextField(
                                      onChanged: (String index) {
                                        dateInput = index;
                                      },
                                      controller: tfdateController,
                                      maxLength: 5,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.indigo),
                                        ),
                                        labelText: "Son Kullanma Tarihi",
                                        labelStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        width: 100,
                                        height: 45,
                                        child: TextButton(
                                          child: Text(
                                            "ADD",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.white70),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              ekle(bankInput, nameInput,
                                                  cardInput, dateInput);
                                            });
                                            tfBankName.clear();
                                            tfCardNo.clear();
                                            tfNameController.clear();
                                            tfdateController.clear();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                  )
                ],
              ),
              elevation: 5,
              shape: CircularNotchedRectangle(),
              color: Colors.black87,
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "WALLET",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70)),
            ),
          ),
          body: FutureBuilder<List<Wallets>>(
            future: tumWallets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var notum = snapshot.data;
                return ListView.builder(
                  itemCount: notum!.length,
                  itemBuilder: (context, index) {
                    var listem = notum[index];
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("${listem.wallet_bank_name}"),
                                      actions: [
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                " Card No: ${listem.wallet_card_no}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "${listem.wallet_person_name}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.indigo,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(60),
                                                    topRight: Radius.circular(
                                                      60,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                    topLeft:
                                                        Radius.circular(30),
                                                  ),
                                                ),
                                                width: 70,
                                                height: 40,
                                                child: TextButton(
                                                  child: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      sil(listem.wallet_id);
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: MediaQuery.of(context).size.width / 1.2,
                                height:
                                    MediaQuery.of(context).size.height / 2.4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${listem.wallet_bank_name}",
                                        style: TextStyle(
                                            fontSize: 26, color: Colors.white),
                                      ),
                                      SizedBox(height: 70),
                                      Text(
                                        "${listem.wallet_card_no}",
                                        style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.white70),
                                      ),
                                      SizedBox(height: 50),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${listem.wallet_person_name}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white70),
                                            ),
                                            Text(
                                              "${listem.wallet_date}",
                                              style: TextStyle(
                                                  fontSize: 26,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center();
            },
          ),
        ),
      ),
    );
  }
}
