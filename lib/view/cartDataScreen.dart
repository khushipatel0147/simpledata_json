import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  PostProvider? providerF;
  PostProvider? providerT;
  @override
  void initState() {
    super.initState();
Provider.of<PostProvider>(context,listen: false).CartDataParsing();
  }
  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<PostProvider>(context, listen: true);
    providerF = Provider.of<PostProvider>(context, listen: false);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Cart Data",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                 providerF!.CartDataParsing();
              },
              icon: Icon(
                Icons.arrow_circle_down_sharp,
                color: Colors.black,
              ))
        ],
      ),
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
                              left: 5, right: 5, bottom: 10),
                          child: Container(
                            height: 150,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(color: Colors.black, width: 1)),
                            child: Center(
                                child: Text(
                                  "${providerF!.cartData[index].id}",
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
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                        child: Text(
                                            "UserId  --->   ${providerF!.cartData[index].userId}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ))),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Date  --->   ${providerF!.cartData[index].date}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                Column(
                                  children: 
                                  providerT!.cartData[index].productlist!.map((e) => Row(
                                    children: [
                                      Text("Product --> ${e.productId}"),
                                      SizedBox(width: 25),
                                      Text("Quntity --> ${e.quantity}"),
                                    ],
                                  )).toList(),
                                  
                                ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "__V  --->   ${providerF!.cartData[index].v}",
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
              itemCount: providerF!.cartData.length,
            ),
          )
        ],
      ),
    ));
  }
}
