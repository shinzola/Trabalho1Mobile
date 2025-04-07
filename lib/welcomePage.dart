import 'package:flutter/material.dart';
import 'package:trabalho/main.dart';

class welcomePage extends StatelessWidget {
  welcomePage({super.key, required this.nameUser});
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPais = TextEditingController();
  TextEditingController _controllerCurso = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerEndereco = TextEditingController();

  final String nameUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo " + nameUser),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical
          crossAxisAlignment: CrossAxisAlignment.center, // horizontal
          children: <Widget>[
            Container(
              child: Text(style: TextStyle(fontSize: 35.0), "Cadastro"),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 350,
              child: TextField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  labelText: "Digite seu nome",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 350,
              child: TextField(
                controller: _controllerEndereco,
                decoration: const InputDecoration(
                  labelText: "Digite seu Endereço",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 350,
              child: TextField(
                obscureText: true,
                controller: _controllerPassword,
                decoration: const InputDecoration(
                  labelText: "Digite sua Senha",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 350,
              child: TextField(
                controller: _controllerEmail,
                decoration: const InputDecoration(
                  labelText: "Digite seu Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 350,
              child: TextField(
                controller: _controllerCurso,
                decoration: const InputDecoration(
                  labelText: "Digite seu Curso",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 350,
              child: TextField(
                controller: _controllerPais,
                decoration: const InputDecoration(
                  labelText: "Digite seu País",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Informações"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nome:" + _controllerName.text),
                          Text("Endereço: " + _controllerEndereco.text),
                          Text("Senha:" + _controllerPassword.text),
                          Text("Email: " + _controllerEmail.text),
                          Text("Curso:" + _controllerCurso.text),
                          Text("Pais: " + _controllerPais.text),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
                fixedSize: WidgetStateProperty.all(Size(350, 40)),
              ),
              child: Text(
                "Salvar informações",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 45.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SteamApp();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.Amber),
                fixedSize: WidgetStateProperty.all(Size(350, 40)),
              ),
              child: Text(
                "Voltar",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
