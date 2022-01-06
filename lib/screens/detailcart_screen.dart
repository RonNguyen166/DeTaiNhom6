import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:project_flutter_mygroup/data/database.dart';
import 'package:project_flutter_mygroup/models/cart.dart';
import 'package:http/http.dart' as http;


import '../theme.dart';
import 'login_screen.dart';

late Future<List<Cart>> listCarts;

double sTotal = 0;


List<Cart> listCartss = [];


class DetailCart extends StatefulWidget {
  const DetailCart({Key? key}) : super(key: key);

  @override
  _DetailCartState createState() => _DetailCartState();
}

class _DetailCartState extends State<DetailCart> {


  @override
  Widget build(BuildContext context) {
    listCarts = fetchCart();

    return Scaffold(
      backgroundColor: lightcolor,
      appBar: AppBar(
        backgroundColor: orangecolor,
        title: Text('Your Cart', style: TextStyle(color: Colors.white, fontSize: 25),),

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(top: 20),
                  child: Text("List Food in Your Cart.",style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.w600),)),
              Container(
                height: 450,
                width: double.infinity,

                child: FutureBuilder<List<Cart>>(
                    future: listCarts,
                    builder: (context, snapshot){
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('An error has occurred!'),
                        );
                      }else if (snapshot.hasData) {

                        listCartss = snapshot.data!;


                        return ListView.builder(
                          itemCount: listCartss.length==0?1:listCartss.length,
                          itemBuilder: (context, index) {

                            if(listCartss.length==0){
                              return Container(
                                  height: 200,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text("you have not ordered yet.", style: TextStyle(fontSize: 18),));
                            }else{
                              double _total = listCartss[index].price*listCartss[index].quantily;

                              return SafeArea(
                                  child: Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      height: 70,
                                      padding: EdgeInsets.only(right: 10,left: 10),

                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                          border: Border.all(color: Colors.black26,width: 1)
                                      ),

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(image: AssetImage(listCartss[index].urlImage), width: 70,height: 70,),
                                          Container(
                                            width: 120,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(listCartss[index].nameFood,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),
                                                Text('Price: ${listCartss[index].price}',style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300 ),),

                                              ],

                                            ),
                                          ),
                                          Container(
                                            width: 120,
                                            child: Row(
                                              children: [
                                                Text('x${listCartss[index].quantily}',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),
                                                SizedBox(width: 7,),
                                                Text(':${_total.toStringAsFixed(2)}\$',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),

                                              ],
                                            ),
                                          ),

                                          IconButton(
                                              onPressed: () async {
                                                await http.delete(Uri.parse('http://192.168.1.4:3000/cart/${listCartss[index].id}'));
                                                setState(() {
                                                  listCarts = fetchCart();
                                                  listCartss = snapshot.data!;
                                                });
                                              },
                                              icon: Icon(Icons.remove_circle_outline, size: 20,color: Colors.black,) )

                                        ],
                                      )
                                  ));
                            }

                          },);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );}}
                ),


              ),

              Container(padding: EdgeInsets.all(10),width: double.infinity,height: 0.2, color: Colors.black54,),
              TotalW(),



            ],
          ),
        ),
      ),
    );

  }
}

class TotalW extends StatefulWidget {
  const TotalW({Key? key}) : super(key: key);

  @override
  _TotalWState createState() => _TotalWState();
}

class _TotalWState extends State<TotalW> {
  @override
  Widget build(BuildContext context) {
    double sumTotal = 0;
    return FutureBuilder<List<Cart>>(
        future: listCarts,
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          }else if (snapshot.hasData) {
            sTotal = 0;
            listCartss = snapshot.data!;
            for(int i =0; i<listCartss.length; i++){
              sTotal += listCartss[i].quantily*listCartss[i].price;
            }

            return Container(

              height: 90,

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: ${sTotal.toStringAsFixed(2)}\$', style: TextStyle(color: Colors.lightBlue,fontSize: 20, fontWeight: FontWeight.w500),),
                  GestureDetector(
                    onTap: () {
                      orderFoods(listCartss);
                      Navigator.pop(context);


                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(25),


                      ),
                      child: Text("Order", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );}}
    );

  }
}


Future orderFoods(List<Cart> listCartss) async {

  for(int i =0; i <listCartss.length; i++){
    final response = await http.post(

        Uri.parse('http://192.168.1.4:3000/order/'),
        body: {
          "idUser": user.id,
          "nameFood": listCartss[i].nameFood,
          "urlImage": listCartss[i].urlImage,
          "price": listCartss[i].price.toString(),
          "quantily": listCartss[i].quantily.toString()
        }

    );
    await http.delete(
      Uri.parse('http://192.168.1.4:3000/cart/${listCartss[i].id}'),
    );

  }


}



