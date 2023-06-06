import 'package:simpledata_json/modal/cartModal.dart';

class DataModal {
  int? id;
  dynamic? price;
  String? title, des, cate, image;
  Rating? rating;

  DataModal({this.id, this.price, this.title, this.des, this.cate, this.image});

  factory DataModal.fromjson(Map m1) {
    return DataModal(
        title: m1['title'],
        image: m1['image'],
        id: m1['id'],
        price: m1['price'],
        cate: m1['category'],
        des: m1['description']);
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromjson(Map m1) {
    return Rating(rate: m1['rate'], count: m1['count']);
  }
}
