import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trabalho/welcomePage.dart';

void main() {
  runApp(const SteamApp());
}

class SteamApp extends StatelessWidget {
  const SteamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Steam App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Steam App Home"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0)),
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/552/552721.png",
                ),
              ),
            ),
            textFieldsMain(),
          ],
        ),
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}

class textFieldsMain extends StatefulWidget {
  @override
  _TextFieldStatefulWidgetState createState() =>
      _TextFieldStatefulWidgetState();
}

class _TextFieldStatefulWidgetState extends State<textFieldsMain> {
  bool _obscureText = true;
  TextEditingController _controlerName = TextEditingController();
  TextEditingController _controlerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(10.0)),

        SizedBox(height: 20),
        Container(
          width: 300,
          child: TextField(
            controller: _controlerName,
            decoration: const InputDecoration(
              labelText: "Digite seu nome",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 300,
          child: TextField(
            controller: _controlerPassword,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: "Digite sua senha",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.password_sharp),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            if (_controlerName.text != "Rodrigo" ||
                _controlerPassword.text != "Tads123") {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Dados incorretos")));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return welcomePage(nameUser: _controlerName.text);
                  },
                ),
              );
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
            fixedSize: WidgetStateProperty.all(Size(300, 40)),
          ),
          child: Text(
            "ENVIAR",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
