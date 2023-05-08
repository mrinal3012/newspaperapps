import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:provider/provider.dart';

class SearchDetailsPage extends StatelessWidget {
  // const SearchDetailsPage({Key? key}) : super(key: key);

  Articles? articles;
  SearchDetailsPage({required this.articles});
  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: newsProvider.gr,
      appBar: AppBar(backgroundColor: newsProvider.gr,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: ListView(
          children: [
            Text("${articles!.title}",
              style: TextStyle(
                  fontSize: 35, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${articles!.publishedAt}",
                  style: TextStyle(fontSize: 16, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black),
                ),
                Text(
                  "less them a minute",
                  style: TextStyle(fontSize: 16, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              width: 50,
              // color: Colors.redAccent,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: "${articles!.urlToImage}",height: 300,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s"),
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Text("Description",
                style: TextStyle(fontSize: 26, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black,fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            Text(
                "${articles!.description}",
                style: TextStyle(fontSize: 22,color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black)),
            SizedBox(
              height: 20,
            ),
            Text("Contruct", style: TextStyle(fontSize: 26, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black,fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            Text(
                "${articles!.content}",
                style: TextStyle(fontSize: 22, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black)),
          ],
        ),
      ),
    );
  }
}
