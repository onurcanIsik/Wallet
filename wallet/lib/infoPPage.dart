import 'package:flutter/material.dart';
import 'package:wallet/main.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                  color: Colors.amber,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "Info Page",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60)),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70,
                  ),
                  height: 150,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "This app hold your Credit Card information. Whenever you need this informaation of Credit Card you can see whenever want.",
                        style: TextStyle(fontSize: 20, color: Colors.indigo),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70,
                  ),
                  height: 150,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Secondly, this app has Database so even if you delete this app your information dont delete. So if you upload it in a few days you can see your information.",
                        style: TextStyle(fontSize: 20, color: Colors.indigo),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70,
                  ),
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Thanks for Download My App :)",
                        style: TextStyle(fontSize: 20, color: Colors.indigo),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.credit_card,
              size: 100,
              color: Colors.indigo,
            )
          ],
        ),
      ),
    );
  }
}
