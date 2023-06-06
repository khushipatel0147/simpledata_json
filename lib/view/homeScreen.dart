import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostProvider? providerF;
  PostProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<PostProvider>(context, listen: true);
    providerF = Provider.of<PostProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                providerF!.postDataParsing();
                Navigator.pushNamed(context, 'post');
              },
              child: Text("Post Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                providerF!.postDataParsing();
                Navigator.pushNamed(context, 'user');
              },
              child: Text("User Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                providerF!.postDataParsing();
                Navigator.pushNamed(context, 'cart');
              },
              child: Text("Cart Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                providerF!.postDataParsing();
                Navigator.pushNamed(context, 'product');
              },
              child: Text("Product Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                providerF!.postDataParsing();
                Navigator.pushNamed(context, 'news');
              },
              child: Text("News Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                providerF!.postDataParsing();
                Navigator.pushNamed(context, 'add');
              },
              child: Text("Add Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    ));
  }
}
