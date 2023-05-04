import 'package:flutter/material.dart';
import 'package:newspaperapps/model/model_class_page.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                          hintText: "Search City",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 20),
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: Icon(Icons.search)),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey,
                  )),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  flex: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "POPULAR CITYS",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.red),
                        ),
                      ),
                      Expanded(
                          flex: 32,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 5),
                              itemCount: 8,
                              itemBuilder: (context, index) => Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "${citylist[index].img}"),
                                      ),
                                      Text(
                                        "${citylist[index].name}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )))
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 10,),
              Expanded(
                flex: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: Text("ALL CITIES",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),)),
                    Expanded(
                      flex: 50,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 40,child: Text("${cityname[index]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)) ,),)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  List<String> cityname=[
    "bagerhat","chuadanga","jashore","jhenaidah","khulna","kushtia","magura","meherpur","narail","satkhira",
  ];
}
