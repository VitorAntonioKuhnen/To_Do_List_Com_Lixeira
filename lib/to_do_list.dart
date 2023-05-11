import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:processo_dados/home_page.dart';
import 'package:processo_dados/lixeira.dart';

class To_Do_List extends StatefulWidget {

  final List<String> tarefasExc;
  String nome;
  String email;
  To_Do_List({Key? key, required this.nome, required this.email, required this.tarefasExc}) : super(key: key);

  @override
  State<To_Do_List> createState() => _To_Do_ListState();
}

class _To_Do_ListState extends State<To_Do_List> {
  List<String> tarefasExc = [];

  List tarefas = ['Trabalhar', 'Estudar', 'Ir Para Casa'];
  // List tarefasExc = [];
  List tarefaSub = [];
  TextEditingController _tarefa = TextEditingController();
  TextEditingController _subtitulo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 44, 179, 145)),
              accountName: Text('Nome: ' + nome),
              accountEmail: Text('Email: ' + email),
              currentAccountPicture: CircleAvatar(child: Text('V'))
            ),
            ListTile(
              // onLongPress: () => print("Home"),
              onTap: () {
                // print(_nome.text);  
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage(texto: _nome.text)));
                // texto = _nome.text;
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Lixeira(tarefasExc: tarefasExc))); 
              },
              // trailing: Icon(Icons.home),


              title: Text('Home'),
              leading: CircleAvatar(child: Icon(Icons.home),),
              subtitle: Text('Inicio'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Lixeira(nome: nome, email: email, tarefasExc: tarefasExc))); 
              },


              title: Text('Lixeira'),
              leading: CircleAvatar(child: Icon(Icons.delete),),
              subtitle: Text('Itens Excluidos'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('To do List'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          //ItemCount é a quantidade de vezes que irá ter a repetição do conexto
          //Index é a posição do item dentro do laço
          child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(tarefas[index]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            tarefasExc.add(tarefas[index]);
                            tarefas.removeAt(index);
                          }
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tarefa Deletada!!'),
                            duration: Duration(seconds: 2),
                          )
                          );
                        },
                        icon: Icon(Icons.delete)));
              }
            )
          ),
      bottomNavigationBar: BottomAppBar(
        height: 40,
        shape: CircularNotchedRectangle(),
        color: Colors.tealAccent.shade700
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: true, //Deixa o botão minusculo
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar Tarefa'),
                  content: TextField(controller: _tarefa),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _tarefa.clear();
                        },
                        child: Text('Cancelar')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tarefas.add(_tarefa.text);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tarefa Adicionada com Sucesso!!'),
                            duration: Duration(seconds: 2),
                          ));
                          print(_tarefa.text);
                          Navigator.pop(context);
                          _tarefa.clear();
                        },
                        child: Text('Adicionar')),
                  ],
                );
              }); //Escrurece a tela
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
