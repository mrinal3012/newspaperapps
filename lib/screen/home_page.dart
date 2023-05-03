import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';
import 'package:newspaperapps/screen/bangladesh_times_page.dart';
import 'package:newspaperapps/screen/city_page.dart';
import 'package:newspaperapps/screen/photo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var indexNum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu,color: Colors.black,),
          Text("Bangladesh Times",style: TextStyle(color: Colors.black),),
          Icon(Icons.search_rounded,color: Colors.black)
        ],),
      ),


      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(flex:1 , child: Container(
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: newslist.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              indexNum==newslist[index];
                            });
                          },
                          child: Container(
                            color:newslist[index]==indexNum?Colors.white:Colors.red,
                            height: 50,
                            width: 100,
                            child: Center(child: Text("${newslist[index].name}",style: TextStyle(fontSize: 20),)),
                          ),
                        ),
                        Container(
                          height: 5,
                          width: 100,
                          color:newslist[index]==indexNum?Colors.red:Colors.blue,
                        )

                      ],),
                  )
              ),
            ),),
            Expanded(flex: 9,child: Container(
              color: Colors.purple,
            ))

          ],
        ),
      ),

    );
  }
}
