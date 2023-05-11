import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:processo_dados/home_page.dart';
import 'package:processo_dados/to_do_list.dart';


class Lixeira extends StatefulWidget {

  final List<String> tarefasExc;
  String nome;
  String email;
  Lixeira({Key? key, required this.nome, required this.email, required this.tarefasExc}) : super(key: key);

  @override
  State<Lixeira> createState() => _LixeiraState();
}

class _LixeiraState extends State<Lixeira> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(
          child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 44, 179, 145)),
              accountName: Text(nome),
              accountEmail: Text(email),
              // currentAccountPicture: CircleAvatar(child: Text('V'))
            ),
            ListTile(
              // onLongPress: () => print("Home"),
              onTap: () {
                // print(_nome.text);  
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage(texto: _nome.text)));
                // texto = _nome.text;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> To_Do_List(nome: nome, email: email, tarefasExc: tarefasExc)));
              },
              // trailing: Icon(Icons.home),


              title: Text('Home'),
              leading: CircleAvatar(child: Icon(Icons.home),),
              subtitle: Text('Entrada'),
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


              title: Text('Lixeira'),
              leading: CircleAvatar(child: Icon(Icons.delete),),
              subtitle: Text('Itens Excluidos'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Lixeira'),
        // title: Text(texto),
      ),
      body:
      Container(
          padding: EdgeInsets.all(10),
          //ItemCount é a quantidade de vezes que irá ter a repetição do conexto
          //Index é a posição do item dentro do laço
          child: ListView.builder(
              itemCount: widget.tarefasExc.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(widget.tarefasExc[index]),
                    // trailing: IconButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         widget.tarefasExc.add(widget.tarefasExc[index]);
                    //         widget.tarefasExc.removeAt(index);
                    //       }
                    //       );
                    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //         content: Text('Tarefa Deletada!!'),
                    //         duration: Duration(seconds: 2),
                    //       )
                    //       );
                    //     },
                    //     icon: Icon(Icons.delete))
                     );
              }
            )
          ),
      //  Container(
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(onPressed: () {
      //         // Navigator.pop(context);
      //         // widget.campo.clear;
      //          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
      //         },
      //       child: Text('Voltar para Home'),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
