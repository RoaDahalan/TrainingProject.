import 'package:flutter/material.dart';
import 'package:training_project/Pages/Login.dart';
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
            // Positioned(
            //   top: 80,
            //   right: 20,
            //   child: Row(
            //     children: [
            //       Icon(Icons.notifications_none_outlined , size: 33 , color: Colors.white,),
            //       SizedBox(width: 15),
            //       Icon(Icons.settings_outlined , size: 30 , color: Colors.white,),
            //     ],
            //   ),
            // ),
            Positioned(
              top: 80,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(50,105,30,0),
                    items: [
                      PopupMenuItem(child: Text('No Notifications Yet')),
                    ],
                  );
                },
                child: Icon(Icons.notifications_none_outlined , size: 33 , color: Colors.white),
              ),
            ),

            Positioned(
              top: 80,
              right: 70,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      TextEditingController nameController = TextEditingController(text: 'Seraj AL-Mutawa');
                      TextEditingController emailController = TextEditingController(text: 'example@email.com');
                      TextEditingController phoneController = TextEditingController(text: '+970123456789');

                      return AlertDialog(
                        title: Text('Edit Account Info'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
                              TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
                              TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Phone')),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Save' , style: TextStyle(color: Color(0xFFAF8344)),),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel' , style: TextStyle(color: Color(0xFFAF8344)),),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.settings_outlined , size: 30 , color: Colors.white),
              ),
            ),



            DraggableScrollableSheet(
              initialChildSize: 0.75,
              // minChildSize: 0.8,
              // maxChildSize: 0.8,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  width: 375,
                  height: 556,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  ),

                  child: ListView(
                    children: [
                      Center(child: Text('Seraj AL-Mutawa' , style: TextStyle(fontSize: 25 , color: Colors.black , fontWeight: FontWeight.bold))),
                      Center(child: Text('Gaza , Palestine' , style: TextStyle(fontSize: 20 , color: Colors.black ))),
                      SizedBox(height: 15),
                      Divider(
                        color: Colors.grey[200],
                        thickness: 4,
                        indent: 0,
                        endIndent: 0,
                      ),


                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Favorite' , style: TextStyle(fontSize: 17 , color: Colors.black ,)),

                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFAF8344),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Text('2' , style: TextStyle(color: Colors.white , fontSize: 13 , fontWeight: FontWeight.bold ),textAlign: TextAlign.center),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_forward_ios_outlined , color: Colors.grey[500] , size: 15,),
                                  ],
                                )
                              ],),

                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Language' , style: TextStyle(fontSize: 17 , color: Colors.black ,)),

                                Row(
                                  children: [
                                    Text('English', style: TextStyle(color:Colors.grey[500]),),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_forward_ios_outlined , color: Colors.grey[500] , size: 15,),
                                  ],
                                )
                              ],),
                            SizedBox(height: 25),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Contact Us' , style: TextStyle(fontSize: 17 , color: Colors.black , )),
                                Icon(Icons.arrow_forward_ios_outlined , color: Colors.grey[500] , size: 15,),
                              ],),
                          ],
                        ),
                      ),

                      SizedBox(height: 25),
                      Divider(
                        color: Colors.grey[200],
                        thickness: 4,
                        indent: 0,
                        endIndent: 0,
                      ),

                      SizedBox(height: 15),
                      InkWell(
                        onTap : (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout , color: Color(0xFFAF8344), size: 20,),
                            SizedBox(width: 5),
                            Text('SIGN OUT' , style: TextStyle(fontSize: 20 , color: Color(0xFFAF8344) ,)),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),
                      Divider(
                        color: Colors.grey[200],
                        thickness: 4,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: 120,
              left: 145,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/img.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
