import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/postProvider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  PostProvider? providerF;
  PostProvider? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).productjson();
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
        backgroundColor: Colors.purple.shade900,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("ShopEasy",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: providerT!.infoList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 280),
              itemBuilder: (context, index) => mybox(index),
              itemCount: providerF!.infoList.length),
    ));
  }

  Widget mybox(int index) {
    return Center(
      child: Container(
        height: 280,
        width: 180,
        color: Colors.purple.shade50,
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 180,
              child: Image.network(
                "${providerF!.infoList[index].image}",
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${providerF!.infoList[index].cate}",
                  style: TextStyle(
                      color: Colors.purple.shade900,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 10),
                Text(
                  "\$${providerF!.infoList[index].price}",
                  style: TextStyle(
                      color: Colors.purple.shade900,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
