import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/data/database.dart';
import 'package:project_flutter_mygroup/models/food.dart';
import 'package:project_flutter_mygroup/screens/detailfood_screen.dart';

import '../main.dart';
import 'home.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
              child: Text("Your foods favorite ",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
          Expanded(
            child:  FutureBuilder<List<Food>>(
                future: listFood,
                builder: (context, snapshot){
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  }else if (snapshot.hasData) {

                    List<Food> listFood = snapshot.data!;
                    int countfavorite =0;
                    for(int i =0; i <listFood.length; i++){
                      if(listFood[i].favorite){
                        countfavorite ++;

                      }
                    }


                    return  GridView.builder(

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                      itemCount: countfavorite == 0? 1: countfavorite,
                      itemBuilder: (context, index) {
                        if(countfavorite==0){
                          return Text("You haven't liked the food yet?");
                        }else{
                          if(listFood[index].favorite){
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
                          }
                          return Text("You haven't liked the food yet?");
                        }

                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );}}
            ),
          )
        ],
      ),
    );
  }
}
