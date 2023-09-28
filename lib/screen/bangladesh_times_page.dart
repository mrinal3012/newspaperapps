import 'package:flutter/material.dart';
import 'package:newspaperapps/porvider/news_provider.dart';
import 'package:provider/provider.dart';

class BangladeshTimesPage extends StatefulWidget {
  const BangladeshTimesPage({Key? key}) : super(key: key);

  @override
  State<BangladeshTimesPage> createState() => _BangladeshTimesPageState();
}

class _BangladeshTimesPageState extends State<BangladeshTimesPage> {
  @override
  Widget build(BuildContext context) {
    var newsProvider=Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Bangladesh Times"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.teal,
        child: Column(
          children: [
            Expanded(child: Container(height: double.infinity,width: double.infinity,color: Colors.amber,)),
            Expanded(child: Container(height: double.infinity,width: double.infinity,color: Colors.pinkAccent,)),
          ],
        ),
      ),
    );
  }
}
