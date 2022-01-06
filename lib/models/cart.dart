
class Cart{
  final String id;
  final String nameFood ;
  final String urlImage;
  final double price;
  final int quantily;

  Cart({
    required this.id,
    required this.nameFood,
    required this.urlImage,
    required this.price,
    required this.quantily
});
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['_id'] as String,
      nameFood: json['nameFood'] as String,
      urlImage: json['urlImage'] as String,
      price: json['price'] as double,
      quantily: json['quantily'] as int,


    );
  }
}