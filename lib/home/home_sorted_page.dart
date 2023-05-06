import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:provider/provider.dart';

class HomeSortedPage extends StatefulWidget {
  const HomeSortedPage({Key? key}) : super(key: key);

  @override
  State<HomeSortedPage> createState() => _HomeSortedPageState();
}

class _HomeSortedPageState extends State<HomeSortedPage> {

  String sortBy="relevancy";

  @override
  Widget build(BuildContext context) {

    var newsProvider=Provider.of<NewsProvider>(context);

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 4, child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)), onPressed: () {
                setState(() {
                  newsProvider.decrement();
                });

              }, child: Text("Prev",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.blueGrey)),),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)), onPressed: () {

                setState(() {
                  newsProvider.increment();
                });
                print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn ${newsProvider.pageNo}");
              }, child: Text("Next",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.blueGrey)),)],),),
          SizedBox(width: 10,),
          Expanded(flex: 3,child:DropdownButton(
            value: sortBy,
            items: [
              DropdownMenuItem(child:Text("relevancy",style: TextStyle(color: Colors.teal),),value:"relevancy", ),
              DropdownMenuItem(child:Text("popularity",style: TextStyle(color: Colors.teal)),value:"popularity", ),
              DropdownMenuItem(child:Text("publishedAt",style: TextStyle(color: Colors.teal)),value:"publishedAt", ),
            ], onChanged: (value) => setState(() {
              sortBy=value!;
            }),) ),
        ],),
    );
  }
}
