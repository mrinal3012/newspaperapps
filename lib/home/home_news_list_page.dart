import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newspaperapps/home/home_details_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:newspaperapps/search/Search_details_page.dart';
import 'package:provider/provider.dart';

class HomeNewsListPage extends StatefulWidget {
  // const HomeNewsListPage({Key? key}) : super(key: key);



  @override
  State<HomeNewsListPage> createState() => _HomeNewsListPageState();
}

class _HomeNewsListPageState extends State<HomeNewsListPage> {

  String  name="mrinal";
  NewsModel ? newsModel;

  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: newsProvider.gr,
      // body: FutureBuilder<NewsModel>(
      //   future: newsProvider.GetHomeData(),
      //   builder: (context, snapshot) {
      //   if(snapshot.connectionState==ConnectionState.waiting){
      //     return Center(child: CircularProgressIndicator());
      //   }else if(snapshot.hasError){
      //     return Text("Some thing is not right");
      //   }else if(snapshot.data==null){
      //     return Text("value is null");
      //   }
      //   return  ListView.builder(
      //     itemCount: snapshot.data!.articles!.length,
      //     itemBuilder: (context, index) => Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: InkWell(
      //           onTap: () {
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageDetails(articles: snapshot.data!.articles![index],),));
      //           },
      //         child: Container(
      //           height: 150,
      //           color: Colors.blue.withOpacity(.1),
      //           width: double.infinity,
      //           child: Row(children: [
      //             Expanded(flex: 2, child:Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 3),
      //               child:ClipRRect(
      //                 borderRadius: BorderRadius.circular(12),
      //                 child: CachedNetworkImage(
      //                   imageUrl: "${snapshot.data!.articles![index].urlToImage}",
      //                   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      //                   errorWidget: (context, url, error) =>Image.asset("images/noimage.jpg"),
      //                 ),
      //               )
      //
      //             ) ),
      //             SizedBox(width: 10,),
      //             Expanded(flex: 3, child:Text("${snapshot.data!.articles![index].title}",style: TextStyle(color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black),) ),
      //           ],),
      //         ),
      //       ),
      //     ),);
      // },),
    );
  }
}
