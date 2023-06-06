import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:simpledata_json/modal/cartModal.dart';
import 'package:simpledata_json/modal/newsModal.dart';
import 'package:simpledata_json/modal/productModal.dart';
import 'package:simpledata_json/modal/userDataModal.dart';
import 'package:simpledata_json/utiles/apiHelper.dart';

class PostProvider extends ChangeNotifier {
  List<dynamic> postData = [];
  List<UserModal> userData = [];
  List<CartModal> cartData = [];
  String link = "https://fakestoreapi.com/products";
  List<DataModal> infoList = [];

  Future<void> postDataParsing() async {
    String postjson = await rootBundle.loadString('assets/json/post.json');
    postData = jsonDecode(postjson);
    notifyListeners();
  }

  Future<void> userDataParsing() async {
    String userjson = await rootBundle.loadString('assets/json/user.json');
    List getData = jsonDecode(userjson);
    userData = getData.map((e) => UserModal.fromjson(e)).toList();
    notifyListeners();
  }

  Future<void> CartDataParsing() async {
    String cartjson = await rootBundle.loadString('assets/json/cart.json');
    List gdata = jsonDecode(cartjson);
    cartData = gdata.map((e) => CartModal.fromjson(e)).toList();
    notifyListeners();
  }

  Future<void> productjson() async {
    var respons = await http.get(Uri.parse(link));
    String? pjson = respons.body;
    List data = jsonDecode(pjson);
    infoList = data.map((e) => DataModal.fromjson(e)).toList();
    print(infoList.length);
    notifyListeners();
  }

  String country='us';

  NewsDataModal? newsDataModal;

  void chnagecountry(String? c)
  {
      country=c!;
      notifyListeners();
  }
  Future<void> njson() async {
    newsDataModal = await NewsApiHelper.newsApiHelper.newsjson();
    notifyListeners();
  }

  Api api = Api();

  void ajson({r1, p1, n1, c1, d1, o1}) {
    api.postData(rate: r1, price: p1, name: n1, cat: c1, desc: d1, offer: o1);
    notifyListeners();
  }
}
