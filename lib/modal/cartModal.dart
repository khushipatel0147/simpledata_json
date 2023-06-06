class CartModal {
  String? date;
  int? id, userId, v;
  List<dynamic>? productlist;

  CartModal({this.productlist, this.date, this.id, this.userId, this.v});

  factory CartModal.fromjson(Map m1) {
    return CartModal(
      id: m1['id'],
      date: m1['date'],
      userId: m1['userId'],
      v: m1['__v'],
      productlist: m1['products'].map((e) => ProductModal.fromjson(e)).toList(),
    );
  }
}

class ProductModal {
  int? productId, quantity;

  ProductModal({this.productId, this.quantity});

  factory ProductModal.fromjson(Map m1) {
    return ProductModal(productId: m1['productId'], quantity: m1['quantity']);
  }
}
