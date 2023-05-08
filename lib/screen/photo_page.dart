import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newspaperapps/http/custom_http_page.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/photo/photo_details_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:provider/provider.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  PicterModel ? picterModel;
  String model="flowers";
  @override
  void initState() {
    model;
    setState(() {

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: newsProvider.gr,
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Expanded(
              flex: 3,
              child: Container(
                  child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                itemCount: photoName.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      model=photoName[index];
                      picterModel= await CustomHttpRequest.fatchPhotoDate(model);
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 2)),
                      child: Center(
                          child: Text(
                        "${photoName[index]}",
                        style: TextStyle(fontSize: 15,color: newsProvider.gr==Color(0xff2A2A36)?Colors.white:Colors.black),
                      )),
                    ),
                  );
                },
              ))),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 10,
              child: picterModel?.hits == null
                  ? SizedBox(
                      height: 0,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoDetailsPage(hits: picterModel!.hits![index])));
                        },
                        child: Container(
                          child: Image.network(fit: BoxFit.cover,"${picterModel!.hits![index].largeImageURL}"),
                        ),
                      ),
                    )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: picterModel?.hits == null
                  ? SizedBox(
                      height: 0,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoDetailsPage(hits: picterModel!.hits![index+1])));
                          },
                          child: Container(
                             child: Image.network(fit: BoxFit.cover,"${picterModel!.hits![index+1].largeImageURL}"),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ]),
      ),
    ));
  }

  List<String> photoName = [
    "model",
    "flowers",
    "nature",
    "river",
    "forest",
    "wild",
    "Iceland",
    "animal",
  ];
}
