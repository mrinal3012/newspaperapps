import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
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

      body: Column(children: [
        Expanded( flex: 1,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,), Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
            Text("hello"),
            SizedBox(width: 40,),
          ],),
        ),
        Expanded(
            flex: 15,
            child: Container(

              height: double.infinity,
              width: double.infinity,
              color: Colors.blueGrey,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 100,color: Colors.white,
                  child: Column(
                    children: [

                    ],
                  ),
                  ),
                ),),
            ))
      ],),
    );
  }
}
