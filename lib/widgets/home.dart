import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/data/database.dart';
import 'package:project_flutter_mygroup/models/food.dart';
import 'package:project_flutter_mygroup/screens/detailfood_screen.dart';

import '../main.dart';




class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Let's create the welcoming Text
          Text(
            "Let's Eat \nOrder your Food Now",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0x55d2d2d2),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search... ",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20.0),
                      ),
                    )),
                RaisedButton(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xFFfc6a26),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          //Now let's build the food menu
          //I'm going to create a custom widget
          Expanded(
            child: FutureBuilder<List<Food>>(
              future: listFood,
              builder: (context, snapshot){
                if (snapshot.hasError) {
                  return const Center(
                  child: Text('An error has occurred!'),
                );
              }else if (snapshot.hasData) {

                  List<Food> listFood = snapshot.data!;


                return  GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                  itemCount: listFood.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailFood(),
                              settings: RouteSettings(
                                arguments: listFood[index],
                              ),));
                      },
                      child: SafeArea(
                        child: Expanded(
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),


                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      listFood[index].imageurl,
                                      height: 65.0,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        listFood[index].nameFood,
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${ listFood[index].price} \$",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                listFood[index] = Food(
                                                    nameFood: listFood[index].nameFood,
                                                    price: listFood[index].price,
                                                    point: listFood[index].point,
                                                    description: listFood[index].description,
                                                    imageurl: listFood[index].imageurl,
                                                    favorite: !listFood[index].favorite);
                                              });
                                            },
                                            icon: listFood[index].favorite?Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ):Icon(
                                              Icons.favorite_border,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
                } else {
                return const Center(
                child: CircularProgressIndicator(),
                );}}
            ),
            // child: GridView.builder(
            //
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //
            //   itemCount: listFood.length,
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: (){
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => DetailFood(),
            //               settings: RouteSettings(
            //                 arguments: listFood[index],
            //               ),));
            //       },
            //       child: SafeArea(
            //         child: Expanded(
            //           child: Container(
            //
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10)
            //             ),
            //
            //
            //             child: Card(
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Image.asset(
            //                       listFood[index].imageurl,
            //                       height: 65.0,
            //                       fit: BoxFit.cover,
            //                     ),
            //                     SizedBox(
            //                       height: 8.0,
            //                     ),
            //                     Flexible(
            //                       child: Text(
            //                         listFood[index].nameFood,
            //                         style: TextStyle(
            //                           fontSize: 22.0,
            //                           fontWeight: FontWeight.w600,
            //                         ),
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 10.0,
            //                     ),
            //                     Row(
            //                       children: [
            //                         Expanded(
            //                           child: Text(
            //                             "${ listFood[index].price} \$",
            //                             style: TextStyle(
            //                               fontSize: 22.0,
            //                               fontWeight: FontWeight.w700,
            //                             ),
            //                           ),
            //                         ),
            //                         Expanded(
            //                           child: IconButton(
            //                             onPressed: () {
            //                               setState(() {
            //                                 listFood[index] = Food(
            //                                     nameFood: listFood[index].nameFood,
            //                                     price: listFood[index].price,
            //                                     point: listFood[index].point,
            //                                     description: listFood[index].description,
            //                                     imageurl: listFood[index].imageurl,
            //                                     favorite: !listFood[index].favorite);
            //                               });
            //                             },
            //                             icon: listFood[index].favorite?Icon(
            //                               Icons.favorite,
            //                               color: Colors.red,
            //                             ):Icon(
            //                               Icons.favorite_border,
            //                               color: Colors.black,
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),

          )
        ],
      ),
    );
  }
}





