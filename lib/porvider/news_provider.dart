import 'package:newspaperapps/http/custom_http_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel? newsModel;

  Future<NewsModel> GetHomeData() async {
    newsModel = await CustomHttpRequest.fatchHomeData();
    return newsModel!;
  }
}
