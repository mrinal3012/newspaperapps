import 'dart:ffi';

import 'package:newspaperapps/http/custom_http_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';



class NewsProvider extends ChangeNotifier {
  NewsModel? newsModel;
  PicterModel ? picterModel;
  int pageNo = 1;
  String sortby="relevancy";

  Color? gr;

  void color(){
    gr=Colors.white;
  }
  void color1(){
    gr=Color(0xff2A2A36);
  }



  Future<NewsModel> GetHomeData(int pageNo,String topic) async {
    newsModel = await CustomHttpRequest.fatchHomeData(pageNo,topic);
    return newsModel!;
  }

  Future<PicterModel> GetPhotoData(String photo)async{
    picterModel = await CustomHttpRequest.fatchPhotoDate(photo);
    return picterModel!;
  }


  void increment(){
    pageNo++;
    notifyListeners();
  }
  void decrement(){
    if(pageNo<=1){
      return null;
    }else{
      pageNo--;
    }
    notifyListeners();
  }
  void SearchName(String name){

  }
}
