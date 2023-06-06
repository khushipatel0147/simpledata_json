import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simpledata_json/modal/newsModal.dart';
import 'package:simpledata_json/modal/productModal.dart';

class NewsApiHelper {
 static NewsApiHelper newsApiHelper=NewsApiHelper();

  String  link="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4830ca4d127d4dce8f05599ac897969c";
  NewsDataModal newsDataModal=NewsDataModal();
  Future<NewsDataModal> newsjson() async {


    var respons = await http.get(Uri.parse(link));
    String? njson = respons.body;
    newsDataModal = jsonDecode(njson);
    print(respons.body);
    return newsDataModal;
  }
}

class Api {
  String link =
      "https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";

  Future postData({name, price, offer, cat, rate, desc}) async {
    var response = await http.post(Uri.parse(link), body: {
      'p_name': name,
      'p_price': price,
      'p_offer': offer,
      'p_category': cat,
      'p_rate': rate,
      'p_desc': desc,
    });
    var ajson = jsonDecode(response.body);

    if (ajson[0]["status"] == 'ok') {
      return 'Successfull...';
    } else {
      return 'Failed';
    }
  }
}
