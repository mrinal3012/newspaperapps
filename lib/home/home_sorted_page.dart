import 'package:flutter/material.dart';

class HomeSortedPage extends StatefulWidget {
  const HomeSortedPage({Key? key}) : super(key: key);

  @override
  State<HomeSortedPage> createState() => _HomeSortedPageState();
}

class _HomeSortedPageState extends State<HomeSortedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 4, child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)), onPressed: () {}, child: Text("Prev",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.blueGrey)),),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)), onPressed: () {}, child: Text("Next",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.blueGrey)),)],),),
          SizedBox(width: 10,),
          Expanded(flex: 3,child:Container(child: Center(child: Text("option",style: TextStyle(fontSize:18,color: Colors.blue),))) ),
        ],),
    );
  }
}
