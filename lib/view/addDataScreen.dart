import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  PostProvider? providerF;
  PostProvider? providerT;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtcat = TextEditingController();
  TextEditingController txtdes = TextEditingController();
  TextEditingController txtrating = TextEditingController();
  TextEditingController txtoffer = TextEditingController();

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
        title: Text("Add Data",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.arrow_circle_down_sharp,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: txtname,
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: txtprice,
                decoration: InputDecoration(
                  label: Text(
                    "Price",
                    style: TextStyle(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: txtcat,
                decoration: InputDecoration(
                  label: Text(
                    "Cat",
                    style: TextStyle(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: txtdes,
                decoration: InputDecoration(
                  label: Text(
                    "Des",
                    style: TextStyle(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: txtrating,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text(
                    "Rating",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                providerF!.ajson(
                    c1: txtcat.text,
                    d1: txtdes.text,
                    n1: txtname.text,
                    o1: txtoffer.text,
                    p1: txtprice.text,
                    r1: txtrating.text);
              },
              child: Text("Add"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    ));
  }
}
