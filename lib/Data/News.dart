import 'dart:convert';

import 'package:news_app/Models/Article.dart';
import 'package:http/http.dart'as http;

class News{
  List<Article> news  = [];
 Future <void> getnews()async{
   String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=54641172214348fc876a1797946ac5b0";

   var response=await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=54641172214348fc876a1797946ac5b0"));
   var jsondata= jsonDecode(response.body);
   if(jsondata['status']=='ok'){
     jsondata['articles'].forEach((element){
       if(element['urlToImage'] != null && element['description'] != null){
         Article article = Article(
           title: element['title'],
           author: element['author'],
           description: element['description'],
           urlToImage: element['urlToImage'],
           publshedAt: DateTime.parse(element['publishedAt']),
           content: element["content"],
           articleUrl: element["url"],
         );
         news.add(article);
       }
     });
   }
 }

}