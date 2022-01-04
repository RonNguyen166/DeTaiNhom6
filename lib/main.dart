import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/screens/login_screen.dart';

import 'data/database.dart';
import 'models/food.dart';

// import './service/user.dart';
// import 'package:http/http.dart' as http;

late Future<List<Food>> listFood;

void main() {
  // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  // print(response.body);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listFood = fetchFood();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}




