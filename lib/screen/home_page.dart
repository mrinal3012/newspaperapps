import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newspaperapps/home/home_details_page.dart';
import 'package:newspaperapps/home/home_news_header.dart';
import 'package:newspaperapps/home/home_news_list_page.dart';
import 'package:newspaperapps/home/home_sorted_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:newspaperapps/screen/bangladesh_times_page.dart';
import 'package:newspaperapps/screen/city_page.dart';
import 'package:newspaperapps/screen/photo_page.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 1;
  String topic = "bangladesh photo";
  List newsName = [];

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: newsProvider.gr,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: newsProvider.gr,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Icon(Icons.menu, color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black,),
            Text(
              "Bangladesh Times",
              style: TextStyle(
                  color: newsProvider.gr == Color(0xff2A2A36)
                      ? Colors.white
                      : Colors.black),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: newslist.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Container(
                              child: TextButton(
                            onPressed: () async {
                              topic = newstopic[index];
                              setState(() {
                                print(
                                    "tttttttttttttttttttttttttttttttttttttttttttttt${newstopic[index]}");
                              });
                            },
                            child: Text(
                              "${newstopic[index]}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: newsProvider.gr == Color(0xff2A2A36)
                                      ? Colors.white
                                      : Colors.black.withOpacity(.6)),
                            ),
                          )),
                        )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              setState(() {
                                if (pageNo <= 1) {
                                  return null;
                                } else {
                                  pageNo--;
                                }
                              });
                            },
                            child: Text("Prev",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueGrey)),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              setState(() {
                                pageNo++;
                              });
                              print(
                                  "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn ${newsProvider.pageNo}");
                            },
                            child: Text("Next",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueGrey)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  newsProvider.color();
                                  setState(() {});
                                },
                                icon: Icon(Icons.light_mode_outlined,
                                    color: newsProvider.gr == Color(0xff2A2A36)
                                        ? Colors.white
                                        : Colors.black)),
                            IconButton(
                                onPressed: () {
                                  newsProvider.color1();
                                  setState(() {
                                    print(
                                        "cccccccccccccccccccccccccccccccccccccccccccccccccccccccc ${newsProvider.gr}");
                                  });
                                },
                                icon: Icon(Icons.nightlight_outlined,
                                    color: newsProvider.gr == Color(0xff2A2A36)
                                        ? Colors.white
                                        : Colors.black))
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 22,
                child: FutureBuilder<NewsModel>(
                  future: newsProvider.GetHomeData(pageNo, topic),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Some thing is not right");
                    } else if (snapshot.data == null) {
                      return Text("value is null");
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePageDetails(
                                articles: snapshot.data!.articles![index],
                              ),
                            ));
                          },
                          child: Container(
                            height: 150,
                            color: Color(0xff001429),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 3),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "${snapshot.data!.articles![index].urlToImage}",
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                                        "images/noimage.jpg"),
                                          ),
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${snapshot.data!.articles![index].source!.name}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${snapshot.data!.articles![index].title}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.add_link_outlined,
                                              color: Colors.blue,
                                            ),
                                            Text(
                                              "${snapshot.data!.articles![index].publishedAt}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  List<String> newstopic = [
    "সর্বশেষ",
    "বিশেষ",
    "রাজনীতি",
    " বিশ্ব ",
    "বাণিজ্য",
    "মতামত",
    " খেলা ",
    "বিনোদন",
    "চাকরি",
    "জীবনযাপন",
  ];
}
