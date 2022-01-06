import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter_mygroup/models/cart.dart';
import 'package:project_flutter_mygroup/models/food.dart';
import 'package:project_flutter_mygroup/screens/login_screen.dart';



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


Future<List<Cart>> fetchCart() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.4:3000/cart/${user.id}'));

  if (response.statusCode == 200) {
    return compute(parseCarts, response.body);

  } else {

    throw Exception('Failed to load Food');
  }
}

List<Cart> parseCarts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
}


Future<List<Cart>> fetchOrder() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.4:3000/order/${user.id}'));

  if (response.statusCode == 200) {
    return compute(parseOrder, response.body);

  } else {

    throw Exception('Failed to load Food');
  }
}

List<Cart> parseOrder(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
}




