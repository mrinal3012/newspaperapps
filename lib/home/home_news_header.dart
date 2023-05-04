import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';

class HomeNewsHeader extends StatefulWidget {
  const HomeNewsHeader({Key? key}) : super(key: key);

  @override
  State<HomeNewsHeader> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: newslist.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
              child: Container(
                child: Text("${newslist[index].name}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(.6)),),
              ),
            )),
      ),
    );
  }
}