import 'package:aa_youtube_clone/model/Video.dart';
import 'package:flutter/material.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  //Método para Listar os videps
  _listVideos(){
    Api api = Api();
    return api.search("");
  }

  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.search("");

    return FutureBuilder<List<Video>?>(
        future: _listVideos(),
        builder: (context, snapshot){
          switch( snapshot.connectionState){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active :
            case ConnectionState.done :
              if (snapshot.hasData){
                return ListView.separated(
                    itemBuilder: (context, index){

                      List<Video>? videos = snapshot.data!;
                      Video video = videos[index];

                      return Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                  image: NetworkImage(video.imagem!)
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo!),
                            subtitle: Text(video.canal!),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    itemCount: snapshot.data!.length
                );
              }else {
                return Center(
                  child: Text("Nenhum dado a ser exibido"),
                );
              }
              break;

          }
        },
    );
  }
}
