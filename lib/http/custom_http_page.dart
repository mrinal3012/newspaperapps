import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:newspaperapps/screen/photo_page.dart';




class CustomHttpRequest{

 static Future<NewsModel> fatchHomeData(pageNo)async{

    NewsModel ? newsModel;
    String url="https://newsapi.org/v2/everything?q=bangladesh&pageSize=10&page=${pageNo}&apiKey=ccdb5fd8b4744dacb1416e93f8c8cf7d";
    var urldata = await http.get(Uri.parse(url));
    var data=jsonDecode(urldata.body);
    newsModel=NewsModel.fromJson(data);
    return newsModel!;
  }

  static Future<NewsModel>fatchSerechDate(query)async{
   NewsModel ? newsModel;
   String url="https://newsapi.org/v2/everything?q=${query}&pageSize=10&apiKey=ccdb5fd8b4744dacb1416e93f8c8cf7d";
   var urldata= await http.get(Uri.parse(url));
   var data=jsonDecode(urldata.body);
   newsModel=NewsModel.fromJson(data);
   return newsModel!;
  }

  static Future<PicterModel>fatchPhotoDate(photo)async{
    PicterModel ? picterModel;
   String url="https://pixabay.com/api/?key=36136910-1bd0485a961dbb4fc3a494842&q=${photo}&image_type=photo";
   var urldata= await http.get(Uri.parse(url));
   var data=jsonDecode(urldata.body);
    picterModel=PicterModel.fromJson(data);
   return picterModel!;
  }
}