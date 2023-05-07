import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newspaperapps/home/home_news_header.dart';
import 'package:newspaperapps/home/home_news_list_page.dart';
import 'package:newspaperapps/home/home_sorted_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/screen/bangladesh_times_page.dart';
import 'package:newspaperapps/screen/city_page.dart';
import 'package:newspaperapps/screen/photo_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List newsName=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.black,),
            Text("Bangladesh Times", style: TextStyle(color: Colors.black),),
            Icon(Icons.search_rounded, color: Colors.black)
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(flex: 3, child: HomeNewsHeader()),
            Expanded(flex: 2, child:HomeSortedPage()),
            Expanded(flex: 22, child: HomeNewsListPage())
          ],
        ),
      ),
    );
  }
}
