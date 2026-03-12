import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<Map<String, dynamic>> itemsData = [
    {
      'title': 'New Music Event on Dubai',
      'subtitle': 'Halls Category',
      'image': 'assets/Rectangle 6 Copy.png',
    },
    {
      'title': 'New Music Event on Dubai',
      'subtitle': 'Halls Category',
      'image': 'assets/Rectangle 6 Copy.png',
    },
    {
      'title': 'New Music Event on Dubai',
      'subtitle': 'Halls Category',
      'image': 'assets/Rectangle 6 Copy.png',
    },
  ];

  List<Widget> buildItemList(List<Map<String, dynamic>> itemsData) {
    return itemsData.map((item) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding:EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset:Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding:EdgeInsets.all(8.0),
              child: Stack(
                children:[ 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(item['image'],
                      width: 100,
                      height: 120, fit: BoxFit.cover
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 25,
                      height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.grey[200],
                        ),
                        child: Icon(Icons.delete , color: Colors.red , size: 25,)
                    ),
                  )
                ]
              ),
            ),
             SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(item['subtitle'], style: TextStyle(color: Colors.grey[700])),
                SizedBox(height: 6),
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('300' , style: TextStyle(fontSize: 12 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                )
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

  //    كل اشي بيخص التاريخ
  // DateTime? selectedDate;
  // Future<void> _pickDate() async {
  //   DateTime? date = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2030),
  //   );
  //   if (date != null) {
  //     setState(() {
  //       selectedDate = date;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE9C75E),
              Color(0xFFAF8344),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60 , bottom: 15),
              child: Text('Cart' , style: TextStyle(fontSize: 25 , color: Colors.white),),
            ),

            Expanded(
              child: Stack(
                children:[
                  DraggableScrollableSheet(
                  initialChildSize: 0.98,
                  minChildSize: 0.95,
                  maxChildSize: 0.98,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(5.0),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            // SizedBox(height: 10),
                            ...buildItemList(itemsData),
                             SizedBox(height: 20),
                            // Total Order + Date Picker Example
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  'Set Date                MM/DD/YYYY'
                                ),
                              ),
                            ),
                             SizedBox(height: 5),
                            Container(
                              padding:  EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xFFE9C75E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Total: 300",
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Your Cart' , style: TextStyle(color: Colors.white , fontSize: 20), textAlign: TextAlign.start,),
                    ),
                  ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
