import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';

class NewsDataScreen extends StatefulWidget {
  const NewsDataScreen({Key? key}) : super(key: key);

  @override
  State<NewsDataScreen> createState() => _NewsDataScreenState();
}

PostProvider? providerF;
PostProvider? providerT;

class _NewsDataScreenState extends State<NewsDataScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).njson();
  }

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<PostProvider>(context, listen: true);
    providerF = Provider.of<PostProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("NewsData",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                    onPressed: () {
                      providerF!.CartDataParsing();
                    },
                    icon: Icon(
                      Icons.arrow_circle_down_sharp,
                      color: Colors.white,
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      "${providerF!.newsDataModal?.articles![0].url}"),
                  Text(
                    "Status ---> ${providerF!.newsDataModal?.articles![0].description}",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Divider(thickness: 0.5, color: Colors.black),
                  Text(
                      "Title  --->   ${providerF!.newsDataModal?.articles![0].content}",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                  Divider(thickness: 0.5, color: Colors.black),
                  Text(
                      "Author  --->   ${providerF!.newsDataModal?.articles![0].author}",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                  Divider(thickness: 0.5, color: Colors.black),
                  Text(
                      "Content  --->   ${providerF!.newsDataModal?.articles![0].title}",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                  Divider(thickness: 0.5, color: Colors.black),
                  Text(
                      "Des  --->   ${providerF!.newsDataModal?.articles![0].title}",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                  Divider(thickness: 0.5, color: Colors.black),
                  Text(
                      "PublishedAt  --->   ${providerF!.newsDataModal?.articles![0].title}",
                      style: TextStyle(
                        fontSize: 13,
                      )),
                  Divider(thickness: 0.5, color: Colors.black),
                  Text(
                      "Source  --->   ${providerF!.newsDataModal?.articles![0].title}",
                      style: TextStyle(
                        fontSize: 13,
                      ))
                ],
              ),
            )));
  }
}
