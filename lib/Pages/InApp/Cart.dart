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

  List<int> quantities = [];
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    quantities = List.filled(itemsData.length, 1);
  }

  List<Widget> buildItemList() {
    if (itemsData.isEmpty) {
      return [
        Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'No items in cart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ];
    }

    return List.generate(itemsData.length, (index) {
      var item = itemsData[index];
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['image'],
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          itemsData.removeAt(index);
                          quantities.removeAt(index);
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Icon(Icons.delete, color: Colors.red, size: 20),
                      ),
                    ),
                  ),
                ],
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
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${quantities[index] * 300}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantities[index] > 1) quantities[index]--;
                            });
                          },
                          icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                        ),
                        Text('${quantities[index]}'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantities[index]++;
                            });
                          },
                          icon: Icon(Icons.add_circle_outline, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  int calculateTotal() {
    if (quantities.isEmpty) return 0;
    return quantities.map((e) => e * 300).reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
              padding: const EdgeInsets.only(top: 60, bottom: 15),
              child: Text(
                'Cart',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  DraggableScrollableSheet(
                    initialChildSize: 0.98,
                    minChildSize: 0.95,
                    maxChildSize: 0.98,
                    builder: (BuildContext context, ScrollController scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              ...buildItemList(),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2030),
                                  );
                                  if (date != null) {
                                    setState(() {
                                      selectedDate = date;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    selectedDate == null
                                        ? 'Set Date                MM/DD/YYYY'
                                        : 'Set Date: ${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}',
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE9C75E),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Total: ${calculateTotal()}",
                                  style: TextStyle(
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
                      child: Text(
                        'Your Cart',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
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