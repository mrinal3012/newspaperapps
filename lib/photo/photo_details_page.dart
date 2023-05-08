import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:provider/provider.dart';

class PhotoDetailsPage extends StatelessWidget {
  // const PhotoDetailsPage({Key? key}) : super(key: key);

  Hits ? hits;
  PhotoDetailsPage({required this.hits});
  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: newsProvider.gr,
      ),
      body: Container(
        child: Column(children: [
          Expanded(child: Container(

            child: Image.network("${hits!.largeImageURL}",fit: BoxFit.cover),
            // decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("${hits!.largeImageURL}"))),
          ),)
        ],),
         ),
    );
  }
}
