

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/models/user.dart';
import './register_screen.dart';
import '../components/background.dart';
import 'package:http/http.dart' as http;


late final User user;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();


  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    loginn()async{

      if( _key.currentState!.validate()){
        Future loginWithEmailPass(String email, String password) async {
          final response = await http.patch(
              Uri.parse('http://192.168.1.4:3000/user/login/'),
              body: {
                "email": email,
                "password": password
              }
          );

          final datata = jsonDecode(response.body);
          return datata;
        }
        final dataaa = await loginWithEmailPass(_emailContoller.text, _passwordController.text);
        if(dataaa.length == 0){
          print("fail");
        }else{
            setState(() {
              user = User(id: dataaa[0]['_id'], email: dataaa[0]['email'], name: dataaa[0]['userName'], password: dataaa[0]['password'], phone: dataaa[0]['phoneNumber']);
            });
          print(dataaa.length );
          _passwordController.clear();
          _emailContoller.clear();
          // Navigator.push(context,
          //     // MaterialPageRoute(builder: (context) => HomeScreen(),
          //     ));
        }
      }
    }

    return Scaffold(
      body: Background(
        child: Expanded(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 136, 34),
                        fontSize: 36
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _emailContoller,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Email is Empty";
                      }else {
                        return null;
                      }
                    },

                    decoration: InputDecoration(
                      labelText: "Email",

                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "password is Empty";
                      }else if(value.length<6){
                        return "Password must be more than 6 characters";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Password"
                    ),
                    obscureText: true,
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF2661FA)
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: (){

                      loginn();

                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 136, 34),
                                Color.fromARGB(255, 255, 177, 41)
                              ]
                          )
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                    },
                    child: Text(
                      "Don't Have an Account? Sign up",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





