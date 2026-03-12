import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:training_project/Commons/CommonWedjits.dart';
import 'package:training_project/Pages/InApp/HomePage.dart';
import 'package:training_project/Pages/Login.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;
  String phoneErrorMessage = '';

  TextEditingController passController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isChecked = false;

  String myCountry = 'Palestine';


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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110 , left: 30),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      color: Colors.black ,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(Icons.arrow_back_ios_new , color: Colors.white , size: 20,),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.82,
                  minChildSize: 0.82,
                  maxChildSize: 0.82,
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
                              Text('New Member', style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),


                              SizedBox(height: 20),

                              customTextField(
                                controller: nameController,
                                obscureText: false,
                                hintText: 'Full Name',
                                suffixIcon: Icons.drive_file_rename_outline,
                              ),

                              SizedBox(height: 18),

                              customTextField(
                                controller: emailController,
                                obscureText: false,
                                hintText: 'Email',
                                suffixIcon: Icons.email_outlined,
                              ),

                              SizedBox(height: 18),

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

                              SizedBox(height: 18),

                              customTextField(
                                controller: passController,
                                obscureText: true,
                                hintText: 'Password',
                                suffixIcon: Icons.remove_red_eye_rounded,
                              ),

                              SizedBox(height: 18),

                              ElevatedButton(
                                  onPressed: (){
                                showCountryPicker(
                                  context: context,
                                  onSelect: (Country) {
                                    myCountry = Country.name;
                                    setState(() {
                                      myCountry = Country.name;
                                    });
                                  }
                                );
                              },
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.white,
                                 foregroundColor: Color(0xFFAF8344),
                                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20),
                                   side: BorderSide(color: Color(0xFFE9C75E), width: 2),
                                 ),
                                      ),
                                  child: Text('Select Country' ,)
                              ),

                              SizedBox(height: 18),

                              Row(
                                children: [
                                  Checkbox(
                                      value: isChecked,
                                      activeColor: Color(0xFFAF8344),
                                      side: BorderSide(
                                        color: Color(0xFFAF8344),
                                        width: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                     // fillColor: Color(0xFFAF8344),
                                      onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                    checkColor: Colors.white,
                                  ),

                                  Expanded(
                                    child: Text('I Read and accept Ocassion Terms and Conditions',
                                      style: TextStyle(fontSize: 13 , color: Color(0xFFAF8344) , fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login()),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Text('Have Account?' , style: TextStyle(fontSize: 18 , color: Color(0xFFAF8344)),),
                                        Text('Sign In' , style: TextStyle(fontSize: 18 , color: Color(0xFFAF8344)),),

                                      ],
                                    ),
                                  ),

                                  ElevatedButton(
                                      onPressed: () {
                                        if (isPhoneValid && passController.text.isNotEmpty && isChecked ) {
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
                                      child: Text('SIGN UP', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                                  ),
                                ],
                              ),

                              // SizedBox(height: 45),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text("Get started Now", style: TextStyle(fontSize: 20),),
                              //     Icon(Icons.arrow_forward , size: 23,)
                              //   ],
                              // ),
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
