import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newspaperapps/http/custom_http_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:newspaperapps/search/Search_details_page.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  TextEditingController _cityController = TextEditingController();
  NewsModel? newsModel;

  String model="model";

  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: newsProvider.gr,
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                Expanded(
                    flex: 15,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextField(
                          controller: _cityController,
                          onEditingComplete: () async {
                            newsModel = await CustomHttpRequest.fatchSerechDate(
                                _cityController.text.toString());
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.blueGrey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.teal)),
                               prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _cityController.clear();
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.clear_outlined))),
                        ))),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                    flex: 45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "POPULAR CITYS",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Colors.red),
                          ),
                        ),
                        Expanded(
                            flex: 32,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 1,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 1),
                                itemCount: citylist.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () async {
                                        // _cityController.text=citylist[index].name;

                                        newsModel = await CustomHttpRequest.fatchSerechDate(citylist[index].name);
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "${citylist[index].img}")),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),


                                          Text(
                                            "${citylist[index].name}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    )))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blueGrey,
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 100,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: newsModel?.articles == null
                        ? SizedBox(
                            height: 0,
                          )
                        : ListView.builder(
                            itemCount: newsModel!.articles!.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                      SearchDetailsPage(articles:newsModel!.articles![index]),));
                                },
                                child: Container(
                                  height: 150,
                                  color: Colors.blue.withOpacity(.1),
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
                                                      "${newsModel!.articles![index].urlToImage}",
                                                  placeholder: (context, url) =>
                                                      Center(
                                                          child: CircularProgressIndicator()), errorWidget: (context, url, error) =>
                                                      Image.asset("images/noimage.jpg"),
                                                ),
                                              ))),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Text("${newsModel!.articles![index].title}",style: TextStyle(color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black),)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
