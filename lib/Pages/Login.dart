import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:training_project/Commons/CommonWedjits.dart';
import 'package:training_project/Pages/InApp/HomePage.dart';
import 'package:training_project/Pages/Register.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;
  String phoneErrorMessage = '';

  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE9C75E),
                Color(0xFFAF8344),
              ]
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset('assets/logo.png',),
                  SizedBox(height: 8,),
                  Text('Logo' ,
                    style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
                  SizedBox(height: 3,),
                  Text('for events management',
                      style: TextStyle(fontSize: 12 ,fontWeight: FontWeight.bold )),
                ],
              ),
            ),

            DraggableScrollableSheet(
              initialChildSize: 0.65,
              //minChildSize: 0.6,
              //maxChildSize: 0.6,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  width: 375,
                  height: 556,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      children: [
                        //SizedBox(height: 1,),
                        Text('Ocassion' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                        SizedBox(height: 5),
                        Text('Hi, SIGNIN', style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),


                        SizedBox(height: 20),

                        phoneNumberField(
                            controller: phoneController,
                            //onChanged: onChanged,
                            onValidated: (bool value) {
                            setState(() {
                              isPhoneValid = value;
                              phoneErrorMessage = value ? '' : 'Incorrect Phone Number';
                            });
                          },
                        ),

                        SizedBox(height: 20),

                        customTextField(
                            controller: passController,
                            obscureText: true,
                            hintText: 'Enter Your Password',
                            suffixIcon: Icons.remove_red_eye_rounded,
                        ),

                        SizedBox(height: 24),

                        InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Forget Your Password ?' , style: TextStyle(fontSize: 15),),
                              ],
                            ),
                          onTap: (){

                          },
                        ),

                        SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => Register()),
                                );
                              },
                                child: Column(
                                  children: [
                                    Text('New Member?' , style: TextStyle(fontSize: 18 , color: Color(0xFFAF8344)),),
                                    Text('Sign Up' , style: TextStyle(fontSize: 18 , color: Color(0xFFAF8344)),),

                                  ],
                                ),
                            ),

                            ElevatedButton(
                                onPressed: () {
                                  if (isPhoneValid) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFFAF8344),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),

                                  fixedSize: Size(200, 60)
                                ),
                                child: Text('LOGIN', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),

                        SizedBox(height: 45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get started Now", style: TextStyle(fontSize: 20),),
                            Icon(Icons.arrow_forward , size: 23,)
                          ],
                        ),
                      ]),
                  ),
                );
              }
            ),

          ]
        ),
      ),
    );
  }
}
