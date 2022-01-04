import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter_mygroup/models/food.dart';


//
// late Map data;
// late List foodsData;
// List<Food> listFood = [];
//
// getFood() async{
//   http.Response response = await http.get(Uri.parse("http://192.168.1.4:3000/food/client/"));
//   data = json.decode(response.body);
//   print(data);
//
//     foodsData = data['foods'];
//     for(int i =0; i<foodsData.length; i++){
//       Food newFood = new Food(nameFood: foodsData[i]['nameFood'], price: foodsData[i]['price'], point: foodsData[i]['point'], description: foodsData[i]['description'], imageurl: foodsData[i]['imageurl'], favorite: foodsData[i]['favorite']);
//       listFood.add(newFood);
//     }
//
// }





Future<List<Food>> fetchFood() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.4:3000/food/client/'));

  if (response.statusCode == 200) {
    return compute(parseFoods, response.body);

  } else {

    throw Exception('Failed to load Food');
  }
}

List<Food> parseFoods(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Food>((json) => Food.fromJson(json)).toList();
}


