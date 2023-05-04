import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:provider/provider.dart';

class HomeNewsListPage extends StatefulWidget {
  const HomeNewsListPage({Key? key}) : super(key: key);

  @override
  State<HomeNewsListPage> createState() => _HomeNewsListPageState();
}

class _HomeNewsListPageState extends State<HomeNewsListPage> {



  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      body: FutureBuilder<NewsModel>(
        future: newsProvider.GetHomeData(),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return Text("Some thing is not right");
        }else if(snapshot.data==null){
          return Text("value is null");
        }
        return ListView.builder(
          itemCount: snapshot.data!.articles!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.blue.withOpacity(.1),
              width: double.infinity,
              child: Row(children: [
                Expanded(flex: 2, child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 3),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                      // Image.network("${snapshot.data!.articles![index].urlToImage}",
                      // width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                    CachedNetworkImage(
                      imageUrl: "${snapshot.data!.articles![index].urlToImage}",
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>Image.asset("images/noimage.jpg"),
                    ),
                  )


                  // Image.network("${snapshot.data!.articles![index].urlToImage}",
                  //   width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                ) ),
                SizedBox(width: 10,),
                Expanded(flex: 3, child:Text("${snapshot.data!.articles![index].title}") ),
              ],),
            ),
          ),);
      },),
    );
  }
}
