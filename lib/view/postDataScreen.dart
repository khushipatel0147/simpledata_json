import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostProvider? providerF;
  PostProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<PostProvider>(context, listen: true);
    providerF = Provider.of<PostProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Post Data",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                providerF!.postDataParsing();
              },
              icon: Icon(
                Icons.arrow_circle_down_sharp,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5),
                          child: Container(
                            height: 225,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Center(
                                child: Text(
                              "${providerF!.postData[index]['id']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 225,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                        child: Text(
                                            "Title :- ${providerF!.postData[index]['title']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                        "Body :- ${providerF!.postData[index]['body']}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              itemCount: providerF!.postData.length,
            ),
          )
        ],
      ),
    ));
  }
}
