import 'package:cached_network_image/cached_network_image.dart';
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
  TextEditingController _photoController = TextEditingController();
  PicterModel? picterModel;
  String model = "flowers";


  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,

        backgroundColor: newsProvider.gr,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: _photoController,
                        onEditingComplete: () async {
                          model = _photoController.text.toString();
                          picterModel = await newsProvider.GetPhotoData(model);
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
                                  _photoController.clear();
                                  setState(() {});
                                },
                                icon: Icon(Icons.clear_outlined))),
                      )


                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                      child: FutureBuilder<PicterModel>(
                          future: newsProvider.GetPhotoData(model),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text("Some thing is not right");
                            } else if (snapshot.data == null) {
                              return Text("value is null");
                            }
                            return
                              MasonryGridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 4,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              itemCount: photoName.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    model = photoName[index].toString();
                                    picterModel = await newsProvider.GetPhotoData(model);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(width: 2)),
                                    child: Center(
                                        child: Text(
                                          "${photoName[index]}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: newsProvider.gr == Color(0xff2A2A36)
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                  ),
                                );
                              },
                            );

                          }
                      )



                  )),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PhotoDetailsPage(
                                      hits: picterModel!.hits![index])));
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${picterModel!.hits![index].largeImageURL}",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset("images/noimage.jpg"),
                              ),
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
                          itemCount: picterModel!.hits!.length - 1,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PhotoDetailsPage(
                                        hits: picterModel!.hits![index + 1])));
                              },
                              child: Container(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${picterModel!.hits![index + 1].largeImageURL}",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset("images/noimage.jpg"),
                                ),
                                // Image.network(fit: BoxFit.cover,"${picterModel!.hits![index+1].largeImageURL}"),
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
    "river",
    "animal",
  ];
}
