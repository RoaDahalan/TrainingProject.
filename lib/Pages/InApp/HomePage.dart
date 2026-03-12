import 'package:flutter/material.dart';
import 'package:training_project/Pages/InApp/Account.dart';
import 'package:training_project/Pages/InApp/Cart.dart';
import 'package:training_project/Pages/InApp/Orders.dart';
import 'package:training_project/Pages/InApp/home.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int currentIndex = 0;

  final List<Widget> pages = [
    Home(),
    Orders(),
    Cart(),
    Account(),

    // Center(child: Text("Home Page", style: TextStyle(fontSize: 24))),
    // Center(child: Text("Orders Page", style: TextStyle(fontSize: 24))),
    // Center(child: Text("Cart Page", style: TextStyle(fontSize: 24))),
    // Center(child: Text("Account Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        //fixedColor: Colors.black,
        backgroundColor: Colors.black87,
        selectedItemColor: Color(0xFFAF8344),
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),


],

      ),

    );
  }
}
