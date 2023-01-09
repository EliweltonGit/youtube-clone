import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: (){
                print("Ação: Videocam");
              },
              icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: (){
              print("Ação: pesquisar");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){
              print("Ação: conta");
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
