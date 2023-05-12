import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:processo_dados/lixeira.dart';
import 'package:processo_dados/to_do_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _nome = TextEditingController();
TextEditingController _email = TextEditingController();
var nome;
var email;
List<String> tarefasExc = [];
List<String> tarefaSub = [];




class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nome,
              decoration: InputDecoration(
                label: Text('Nome'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              )),
              SizedBox(
              height: 5,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              print(_nome.text);  
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage(texto: _nome.text)));
              nome = _nome.text;
              email = _email.text;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> To_Do_List(nome: nome, email: email, tarefasExc: tarefasExc, tarefaSub: tarefaSub,))); //Destroi a pagina que estáva após fazer o direcionamento
              _nome.clear();
            },
            child: Text('Entrar'),
            )
          ],
        ),
      ),
    );
  }
}
