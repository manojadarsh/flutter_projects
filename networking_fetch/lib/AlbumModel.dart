class Album {
  final int id;
  final String sno;
  final String currency;
  final String product_name;
  final String product_description;
  final int price;
  final int stock;

  Album({this.id, this.product_name, this.product_description, this.sno, this.price, this.stock, this.currency});

  factory Album.fromJson(Map<Album, dynamic> json) {
    return Album(
      id: json['id'],
      product_name: json['product_name'],
      sno: json['sno'],
      product_description: json['product_description'],
      price: json['price'],
      currency: json['currency'],
      stock: json['stock']
    );
  }
}