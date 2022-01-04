import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RestaurantWidget extends StatefulWidget {
  const RestaurantWidget({Key? key}) : super(key: key);

  @override
  _RestaurantWidgetState createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {

  final List<String> imageList = [
    "assets/images/restaurant01.jpg",
    "assets/images/restaurant02.jpg",
    "assets/images/restaurant03.jpg",
    "assets/images/restaurant04.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView(
        children: [
          SizedBox(height: 20,),


          Container(
            height: 200,
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
              ),
              items: imageList.map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(e,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,)
                  ],
                ) ,
              )).toList(),
            ),
          ),
          SizedBox(height: 20),
          Container(height: 0.5,width: double.infinity,color: Colors.black26,),


          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
              child: Text("Information", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w500, fontSize: 18),)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 70,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Assessment',style: TextStyle(color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500),),
                  Row(
                    children: [
                      Icon(Icons.star_border, color: Colors.amberAccent,),
                      Icon(Icons.star_border, color: Colors.amberAccent,),
                      Icon(Icons.star_border, color: Colors.amberAccent,),
                      Icon(Icons.star_border, color: Colors.amberAccent,),
                      Icon(Icons.star_border,),

                    ],
                  )
                ],
              )),
              Container(height:70,width: 0.5,color: Colors.black26,),

              Container(
                  height: 70,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Addresss',style: TextStyle(color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_location,),
                          Text(" Da Nang...",style: TextStyle(color: Colors.black, fontSize: 15),)


                        ],
                      )
                    ],
                  )),
              Container(height:70,width: 0.5,color: Colors.black26,),
              Container(
                  height: 70,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Phone',style: TextStyle(color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone,),
                          Text(" 0357863600",style: TextStyle(color: Colors.black, fontSize: 15),)


                        ],
                      )
                    ],
                  )),

            ],
          ),
          SizedBox(height: 10),
          Container(height: 0.5,width: double.infinity,color: Colors.black26,),

          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text("Introduce", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w500, fontSize: 18),)),


          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Text('   There’s a famous restaurant just around the corner from where I live. It’s an Italian restaurant so you can eat various pasta dishes and pizzas. I usually go there with my family for a slap-up meal on special occasions. It’s quite a posh restaurant, the kind of place you will take someone if you want to wine and dine them. We usually order a 3-course meal: a light starter then a main dish. I have quite a sweet tooth so I always look forward to the dessert. I usually order Tiramisu. It makes my mouth water just to think about it. I’m always totally full up by the end. Why do I enjoy eating there? The food is always on point. Well, it’s not cheap but my parents always foot the bill, so it’s always a nice treat.',
              textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16,),
              )),
          SizedBox(height: 20,),
          Container(height: 0.5,width: double.infinity,color: Colors.black26,),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text("The chefs of the restaurant", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w500, fontSize: 18),)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SafeArea(
                child: Container(
                    height: 150,
                    width: 120,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Image(image: NetworkImage('https://static2.yan.vn/YanNews/2167221/202109/4-10f94f12.jpg',), fit: BoxFit.cover,),

                        ),
                        SizedBox(height: 10,),
                        Text("Chef:",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text("Kim Hoàng Anh",style: TextStyle(color: Colors.black, fontSize: 16),),

                      ],
                    )),
              ),
              SafeArea(
                child: Container(
                    height: 150,
                    width: 120,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Image(image: NetworkImage('https://nguoinoitieng.tv/images/nnt/102/1/bgb5.jpg',), fit: BoxFit.cover,),

                        ),
                        SizedBox(height: 10,),
                        Text("Chef:",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text("Hoshi Phan",style: TextStyle(color: Colors.black, fontSize: 16),),

                      ],
                    )),
              ),
              SafeArea(
                child: Container(
                    height: 150,
                    width: 120,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Image(image: NetworkImage('https://vnn-imgs-a1.vgcloud.vn/znews-photo.zadn.vn/w860/Uploaded/zngure/2021_09_27/Salt_Bae_Gold_Steak_Miami_Police_1_.jpg',), fit: BoxFit.cover,),

                        ),
                        SizedBox(height: 10,),
                        Text("Chef:",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        Text("Nusret Gökçe",style: TextStyle(color: Colors.black, fontSize: 16),),

                      ],
                    )),
              ),

            ],
          ),
          SizedBox(height: 40,)



        ],
      ),
    );
  }
}
