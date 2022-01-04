

class Food  {
  final String nameFood;
  final double price;
  final int point;
  final String description;
  final String imageurl;
  late final bool favorite;


  Food({
    required this.nameFood,
    required this.price,
    required this.point,
    required this.description,
    required this.imageurl,
    required this.favorite

  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      nameFood: json['nameFood'] as String,
      price: json['price'] as double,
      point: json['point'] as int,
      description: json['description'] as String,
      imageurl: json['imageurl'] as String,
      favorite: json['favorite'] as bool,

    );
  }




}