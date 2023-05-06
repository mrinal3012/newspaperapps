import 'dart:ffi';

import 'package:newspaperapps/http/custom_http_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';



class NewsProvider extends ChangeNotifier {
  NewsModel? newsModel;
  int pageNo = 1;
  String sortby="relevancy";



  Future<NewsModel> GetHomeData() async {
    newsModel = await CustomHttpRequest.fatchHomeData(pageNo);
    return newsModel!;
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
