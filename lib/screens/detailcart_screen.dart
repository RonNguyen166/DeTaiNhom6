import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/data/data.dart';

import '../theme.dart';


class DetailCart extends StatefulWidget {
  const DetailCart({Key? key}) : super(key: key);

  @override
  _DetailCartState createState() => _DetailCartState();
}

class _DetailCartState extends State<DetailCart> {

  @override
  Widget build(BuildContext context) {
    double sumTotal = 0;
    for(int i = 0; i<listCart.length; i++){
      setState(() {
        sumTotal += listCart[i].price*listCart[i].quantily;
      });

    };




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
                child: ListView.builder(
                    itemCount: listCart.length==0?1:listCart.length,
                    itemBuilder: (context, index) {


                      if(listCart.length==0){
                        return Container(
                          height: 200,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text("you have not ordered yet.", style: TextStyle(fontSize: 18),));
                      }else{

                        double _total = listCart[index].price*listCart[index].quantily;

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
                                    Image(image: AssetImage(listCart[index].urlImage), width: 70,height: 70,),
                                    Container(
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(listCart[index].nameFood,style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),
                                          Text('Price: ${listCart[index].price}',style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300 ),),

                                        ],

                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Row(
                                        children: [
                                          Text('x${listCart[index].quantily}',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),
                                          SizedBox(width: 7,),
                                          Text(':${_total.toStringAsFixed(2)}\$',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600 ),),

                                        ],
                                      ),
                                    ),

                                    IconButton(onPressed: (){
                                     setState(() {
                                       listCart.removeAt(index);
                                     });
                                    }, icon: Icon(Icons.remove_circle_outline, size: 20,color: Colors.black,) )



                                  ],
                                )
                            ));
                      }

                    },),
              ),
              Container(padding: EdgeInsets.all(10),width: double.infinity,height: 0.2, color: Colors.black54,),
              Container(

                height: 90,

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: ${sumTotal.toStringAsFixed(2)}\$', style: TextStyle(color: Colors.lightBlue,fontSize: 20, fontWeight: FontWeight.w500),),
                    GestureDetector(
                        onTap: (){},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}


