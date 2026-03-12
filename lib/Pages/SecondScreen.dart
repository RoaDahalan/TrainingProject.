import 'package:flutter/material.dart';
import 'package:training_project/Pages/Login.dart';
import 'package:training_project/Pages/Register.dart';
class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAF8344),
      body: Stack(
        children: [
          Image.asset('assets/walkthrough_bg02.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),



          DraggableScrollableSheet(
            initialChildSize: 0.43,
            minChildSize: 0.37,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27),
                    topRight: Radius.circular(27),
                  ),

                ),

                child: ListView(
                  controller: scrollController,
                  shrinkWrap: true,
                    children: [
                      SizedBox(height: 10,),
                      Center(
                        child: Text('EVENTS COLLECTION',
                          style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                      ),
                      //SizedBox(height: 7),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 45 , vertical: 10),
                        child: Center(
                          child: Text('Discover the best things to do this week in your city',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20 , color: Colors.grey  )),
                        ),
                      ),

                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 40 , vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Register()),
                                  );
                            },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color(0xFFAF8344),
                                  backgroundColor: Color(0xFFFBEEDD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  minimumSize: Size(120, 55),
                                ),
                                child: Text('SignUp', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                            ),

                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFFAF8344),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  minimumSize: Size(190, 55),
                                ),
                                child: Text('LOGIN', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                            ),
                        ]
                                        ),
                      ),
                      
                      InkWell(
                        onTap: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get started Now", style: TextStyle(fontSize: 20),),
                            Icon(Icons.arrow_forward , size: 23,)
                          ],
                        ),
                      ),
                      
                ]),
              );
            }

          ),

          ]
      ),
    );
;
  }
}
