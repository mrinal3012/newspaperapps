import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Expanded(


          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 130,
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.asset(
                          "images/news.jpg",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text("Text details"),
                            TextButton(onPressed: () {}, child: Text("Details"))
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 3,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
          ),
        ),
      )



      ),
    );
  }
}
