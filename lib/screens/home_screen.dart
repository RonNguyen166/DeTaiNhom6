import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/models/user.dart';

import 'package:project_flutter_mygroup/widgets/favorite.dart';
import 'package:project_flutter_mygroup/widgets/home.dart';
import 'package:project_flutter_mygroup/widgets/restaurant.dart';
import 'package:project_flutter_mygroup/widgets/user.dart';

import 'detailcart_screen.dart';

import 'login_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodApp(),
    );
  }
}





class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  //here i'm going to place a list of image url
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f4f6),
      //let's start by the appbar
      appBar: AppBar(
        foregroundColor: Colors.deepOrange,
        backgroundColor: Color(0xfff1f4f6),
        title: Text(
          "Food App",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFFfc6a26),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,


        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 25,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailCart(),));
            },
          )
        ],
      ),

      //Now let's build the body of our app
      body: listWidget[_selectedIndex],

      drawer: Drawer(

        child: Container(
          height: 500,

          color: Color(0xffeae2df),
          child: ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xf3f14d19),
                          Color(0xd0f66836)
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45)
                      ),
                      child: Image(image: NetworkImage('https://4.bp.blogspot.com/-AYOvATaN5wQ/V5sRt4Kim_I/AAAAAAAAF8s/QWR5ZHQ8N38ByHRLP2nOCJySfMmJur5sACLcB/s280/sieu-nhan-cuu-the-gioi.jpg'),),
                    ),
                    SizedBox(height: 10,),
                    Text("${user.name}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(

                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCECECE),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_circle_outlined, color: Colors.deepOrange, size: 30,),
                                SizedBox(width: 26,),
                                Text('My Account', style: TextStyle(color: Colors.black, fontSize: 18),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 20,),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(

                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCECECE),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.notifications_none, color: Colors.deepOrange, size: 30,),
                                SizedBox(width: 26,),
                                Text('Notifications', style: TextStyle(color: Colors.black, fontSize: 18),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 20,),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(

                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCECECE),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.settings, color: Colors.deepOrange, size: 30,),
                                SizedBox(width: 26,),
                                Text('Settings', style: TextStyle(color: Colors.black, fontSize: 18),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 20,),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(

                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCECECE),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.help_outline, color: Colors.deepOrange, size: 30,),
                                SizedBox(width: 26,),
                                Text('Help Center', style: TextStyle(color: Colors.black, fontSize: 18),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 20,),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: Container(

                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFCECECE),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout, color: Colors.deepOrange, size: 30,),
                                SizedBox(width: 26,),
                                Text('Log Out', style: TextStyle(color: Colors.black, fontSize: 18),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 20,),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      //Now let's create the bottom bar
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Color(0xffeaeaea),
        elevation: 0.0,
        unselectedItemColor: Color(0xdd6c6c6c),
        selectedItemColor: Color(0xFFfc6a26),
        items: [
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text("Restaurant"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

      ),
    );
  }
}

List<Widget> listWidget =[
  HomeWidget(),
  RestaurantWidget(),
  // RestaurantWidget(),

  FavoriteWidget(),
  UserWidget()
];