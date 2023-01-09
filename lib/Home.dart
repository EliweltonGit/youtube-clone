import 'package:aa_youtube_clone/CustomSearchDelegate.dart';
import 'package:aa_youtube_clone/telas/Biblioteca.dart';
import 'package:aa_youtube_clone/telas/EmAlta.dart';
import 'package:aa_youtube_clone/telas/Inicio.dart';
import 'package:aa_youtube_clone/telas/Inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async{
              String? res = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
              );
            },
            icon: Icon(Icons.search),
          ),

          /*IconButton(
              onPressed: (){
                print("Ação: Videocam");
              },
              icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: (){
              print("Ação: conta");
            },
            icon: Icon(Icons.account_circle),
          ),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.whatshot),
                label: 'Em Alta'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions),
                label: 'Inscrições'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: 'Biblioteca'
            ),
          ]),
    );
  }
}
