import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/data/database.dart';
import 'package:project_flutter_mygroup/models/cart.dart';
import 'package:http/http.dart' as http;

late Future<List<Cart>> listOrder;


class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    listOrder = fetchOrder();

    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("The dishes you ordered ",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
          Container(
            height: 420,
            child: FutureBuilder<List<Cart>>(
                future: listOrder,
                builder: (context, snapshot){
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  }else if (snapshot.hasData) {

                    List<Cart> listOrder = snapshot.data!;


                    return ListView.builder(
                      itemCount: listOrder.length==0?1:listOrder.length,
                      itemBuilder: (context, index) {

                        if(listOrder.length==0){
                          return Container(
                              height: 200,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text("you have not ordered yet.", style: TextStyle(fontSize: 18),));
                        }else{
                          double _total = listOrder[index].price*listOrder[index].quantily;

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
                                      Image(image: AssetImage(listOrder[index].urlImage), width: 70,height: 70,),
                                      Container(
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(listOrder[index].nameFood,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),
                                            Text('Price: ${listOrder[index].price}',style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300 ),),

                                          ],

                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: Row(
                                          children: [
                                            Text('x${listOrder[index].quantily}',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),
                                            SizedBox(width: 7,),
                                            Text(':${_total.toStringAsFixed(2)}\$',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),

                                          ],
                                        ),
                                      ),



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
          Expanded(
            child: Container(
              child: FutureBuilder<List<Cart>>(
                  future: listOrder,
                  builder: (context, snapshot){
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error has occurred!'),
                      );
                    }else if (snapshot.hasData) {
                      double sumOrder = 0;

                      List<Cart> listOrder = snapshot.data!;
                      for(int i = 0; i< listOrder.length; i ++){
                        sumOrder += listOrder[i].quantily*listOrder[i].price;
                      }


                      return Container(

                        height: 90,

                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Total Order: ${sumOrder.toStringAsFixed(2)}\$', style: TextStyle(color: Colors.lightBlue,fontSize: 20, fontWeight: FontWeight.w500),),

                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );}}
              ),
            ),
          ),
        ],
      ),
    );
  }
}
