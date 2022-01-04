
import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/data/data.dart';
import 'package:project_flutter_mygroup/models/cart.dart';
import 'package:project_flutter_mygroup/models/food.dart';
import '../theme.dart';
import './home_screen.dart';




class DetailFood extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DetailFood> {

int quantily = 1;

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;
    double _price = quantily*food.price;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangecolor,
        title:  Text(
          'Detai Food',
          style: whiteTextStyle.copyWith(
              color: Colors.white,
              fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: food.favorite?Icon(
              Icons.favorite,
              color: Colors.red,
            ):Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                  child: Image.asset(food.imageurl, height: 260,)),

              ListView(
                children: [
                  SizedBox(
                    height: 270,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      color: whitecolor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.nameFood,
                                style: darkblueTextStyle.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                'Price: ${food.price}',
                                style: orangeTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              // Container(
                              //   width: 300,
                              //   height: 70,
                              //   color: lightcolor,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Info(
                              //           name: 'FreeDelivery',
                              //           imageUrl: 'assets/icon_dolar.png'),
                              //       Info(
                              //           name: 'FreeDelivery',
                              //           imageUrl: 'assets/icon_jam.png'),
                              //       Info(
                              //           name: '30 menit',
                              //           imageUrl: 'assets/icon_bintang.png'),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Text(
                                'Description',
                                style: darkblueTextStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  'Cream Sweet Pie is a pie made from real honey \n and combined with cream on top of the pie',
                                  style: grayTextStyle.copyWith(fontSize: 16)),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(onPressed:(){
                                   if(quantily >1){
                                     setState(() {
                                       quantily--;
                                     });
                                   };
                                  },
                                    child: Icon(Icons.remove),
                                    backgroundColor: darkbluecolor,
                                    tooltip: 'increment',

                                  ),
                                  SizedBox(width: 15,),
                                  Text('${quantily}',style: darkblueTextStyle.copyWith(fontSize: 18),),
                                  SizedBox(width: 15,),

                                  FloatingActionButton(onPressed:(){
                                    setState(() {
                                      quantily++;
                                    });
                                  },
                                    child: Icon(Icons.add),
                                    backgroundColor: Colors.deepOrange,

                                    tooltip: 'decrement',
                                  ),
                                  SizedBox(width: 40,),
                                  Text('Total: ${_price.toStringAsFixed(2)}',style: orangeTextStyle.copyWith(fontWeight: FontWeight.w600,fontSize: 18),)

                                ],
                              ),
                              SizedBox(height: 25,),
                              GestureDetector(

                                onTap: (){

                                  Navigator.pop(context);

                                    listCart.add(new Cart(
                                        nameFood: food.nameFood,
                                        urlImage: food.imageurl,
                                        price: food.price,
                                        quantily: quantily));

                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                  ),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width - (2 * 24),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                    color: Colors.deepOrange,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Checkout Now',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
