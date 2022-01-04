import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/screens/login_screen.dart';


class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              alignment: Alignment.center,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 150,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),

                    ),
                    width: 150,
                    child: Image(image: NetworkImage('https://4.bp.blogspot.com/-AYOvATaN5wQ/V5sRt4Kim_I/AAAAAAAAF8s/QWR5ZHQ8N38ByHRLP2nOCJySfMmJur5sACLcB/s280/sieu-nhan-cuu-the-gioi.jpg'),),
                  ),
                  Positioned(
                      bottom: -5,
                      right: -5,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_outlined, size: 40, color: Colors.black,)))



                ],
              ),
            ),
            Center(child: Text("${user.name}", style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.w600),)),
            SizedBox(height: 30,),
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
            SizedBox(height: 30,),


          ],
        ),
      ),
    );
  }
}
