import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';

class PhotoDetailsPage extends StatelessWidget {
  // const PhotoDetailsPage({Key? key}) : super(key: key);

  Hits ? hits;
  PhotoDetailsPage({required this.hits});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
