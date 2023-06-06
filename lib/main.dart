import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';
import 'package:simpledata_json/view/addDataScreen.dart';
import 'package:simpledata_json/view/cartDataScreen.dart';
import 'package:simpledata_json/view/homeScreen.dart';
import 'package:simpledata_json/view/newsDataScreen.dart';
import 'package:simpledata_json/view/postDataScreen.dart';
import 'package:simpledata_json/view/productDataScreen.dart';
import 'package:simpledata_json/view/userDataScreen.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomeScreen(),
        'post':(context) => PostScreen(),
        'user':(context) => UserScreen(),
        'cart':(context) => CartScreen(),
        'product':(context) => ProductScreen(),
         'news':(context) => NewsDataScreen(),
        'add':(context) => AddScreen(),
      },
    ),
  ));
}