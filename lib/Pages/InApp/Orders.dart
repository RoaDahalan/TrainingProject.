import 'package:flutter/material.dart';
class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  final List<Map<String, String>> currentOrders = [
    {'product': 'Order #52001', 'status': 'Booking Date: 25 Dec. 2020, 08:30 am' , 'price':'300' , 'photo':'assets/guitar.png'},
    {'product': 'Order #52001', 'status': 'Booking Date: 25 Dec. 2020, 08:30 am', 'price':'300', 'photo':'assets/senima.png'},
    {'product': 'Order #52001', 'status': 'Booking Date: 25 Dec. 2020, 08:30 am', 'price':'300', 'photo':'assets/guitar.png'},
  ];

  final List<Map<String, String>> completedOrders = [
    {'product': 'Order #52001', 'status': 'Booking Date: 25 Dec. 2020, 08:30 am' , 'price':'300', 'photo':'assets/guitar.png'},
    {'product': 'Order #52001', 'status': 'Booking Date: 25 Dec. 2020, 08:30 am' , 'price':'300', 'photo':'assets/guitar.png'},
  ];


  Widget buildOrderPage(Map<String, String> order) {
    return InkWell(
      onTap: (){
        showOrderDialog(order);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 14 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order['product']!, style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 20)),
                  Text('${order['price']}' , style: TextStyle(color: Color(0xFFAF8344) , fontSize: 20),),
                  Text('${order['status']}', style: TextStyle( fontSize: 15 , color: Colors.grey),),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey[200],
              thickness: 4,
            )
          ],
        ),
      ),
    );
  }

  // للديالوج
  void showOrderDialog(Map<String, String> order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(order['product']!, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (order['photo'] != null && order['photo']!.isNotEmpty)
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      order['photo']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Text('Price: ${order['price']}', style: TextStyle(color: Color(0xFFAF8344), fontSize: 18)),
              const SizedBox(height: 5),
              Text('Status: ${order['status']}', style: TextStyle(fontSize: 16)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close' , style: TextStyle(color: Color(0xFFAF8344))),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Orders', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE9C75E),
                  Color(0xFFAF8344),
                ],
              ),
            ),
          ),
          bottom:  TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xFFDCDCDC),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontSize: 20),
            tabs: [
              Tab(text: 'Current'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.white
            ),
            child: TabBarView(
              children: [
                //   الحالية
                ListView(
                  children:
                  currentOrders.map((order) => buildOrderPage(order)).toList(),
                ),

                //   المكتملة
                ListView(
                  children:
                  completedOrders.map((order) => buildOrderPage(order)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
