import 'package:aa_youtube_clone/model/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyAghrfE6K0GLX_PGxtkvZLr-4vHAW5f5DQ";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  search(String pesquisar) async {
      http.Response response = await http.get(Uri.parse(
          URL_BASE + "search"
              "?part=snippet"
              "&type=video"
              "&maxResults=20"
              "&order=date"
              "&key=$CHAVE_YOUTUBE_API"
              //"&channelId=$ID_CANAL"
              "&q=$pesquisar"
      ));
      if(response.statusCode == 200){
        Map<String, dynamic> dadosJson = json.decode(response.body);

        List<Video> videos = dadosJson["items"].map<Video>(
            (map){
              return Video.fromJson(map);
            }
        ).toList();

        for (var video in videos){
          print("Resultado: " + video.titulo!);
        }

        /*for (var video in dadosJson["items"]){
          print("Resultado: " + video.toString());
        }*/

        //print("Resultado: " + dadosJson["items"].toString());

      } else{

      }
  }
}