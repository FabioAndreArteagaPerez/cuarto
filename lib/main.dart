import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(Cuarto());

class Cuarto extends StatelessWidget {
  const Cuarto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Magic Fabio",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "Aplication/json"});
    data = json.decode(response.body);
    print(data[2]["title"]);
    return "Succes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Magic Fabio"),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(50.0),
              child: Image.network(
                  "https://cdn.shopify.com/s/files/1/1061/1924/products/Crystal_Magic_Ball_grande.png?v=1571606035"),
            ),
            Center(
              child: RaisedButton(
                child: Text("Lucky"),
                onPressed: () {
                  var t = DateTime.now();
                  print(t);
                  getData();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Lucky Phrase",
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
