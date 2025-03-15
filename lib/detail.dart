import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String passedUrl;
  final String passedTitle;
  final int passedPrice;

  const Detail(
      {super.key,
      required this.passedUrl,
      required this.passedTitle,
      required this.passedPrice});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final jumlah = TextEditingController();
  int total = 0;

  _calculate() {
    setState(() {
      total = widget.passedPrice * int.parse(jumlah.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Detail Pilihan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(widget.passedUrl),
              Text(
                widget.passedTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Rp.${widget.passedPrice},00",
                style: TextStyle(fontSize: 17),
              ),
              TextField(
                controller: jumlah,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Jumlah beli")),
              ),
              ElevatedButton(
                  onPressed: () {
                    _calculate();
                  },
                  child: Text("Hitung")),
              Text(
                "TOTAL HARGA : Rp.$total,00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
