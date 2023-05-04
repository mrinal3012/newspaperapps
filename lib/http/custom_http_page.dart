import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newspaperapps/model/model_class_page.dart';

class CustomHttpRequest{

 static Future<NewsModel> fatchHomeData()async{

    NewsModel ? newsModel;
    String url="https://newsapi.org/v2/everything?q=india&apiKey=ccdb5fd8b4744dacb1416e93f8c8cf7d";
    var urldata = await http.get(Uri.parse(url));
    var data=jsonDecode(urldata.body);
    newsModel=NewsModel.fromJson(data);
    return newsModel!;
  }
}