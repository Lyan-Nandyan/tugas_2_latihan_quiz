import 'package:flutter/material.dart';
import 'package:tugas_2_latihan_quiz/detail.dart';
import 'package:tugas_2_latihan_quiz/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            Text("Hallo Selamat datang", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.logout),
              color: Colors.red),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/food.jpg"),
            Text(
              "Daftar Menu:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _card("assets/images/plate.jpg", "Nasi Goreng", 3000),
              _card("assets/images/plate.jpg", "Nasi padang", 10000),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _card("assets/images/plate.jpg", "Ayam", 8000),
              _card("assets/images/plate.jpg", "Soto", 8000),
            ]),
          ],
        ),
      ),
    ));
  }

  _card(String url, String title, int price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 180,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Image.asset(url),
                  Text(title),
                  Text("Rp.$price,00"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('BELI'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                  passedUrl: url,
                                  passedTitle: title,
                                  passedPrice: price)));
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
