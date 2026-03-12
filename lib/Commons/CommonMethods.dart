import 'package:flutter/material.dart';

//   CATEGORIES FUNCTION
List<Widget> buildCategoryContainers(List<Map<String, String>> categoriesData) {
  return categoriesData.map((category) {
    return Container(
      width: 100,
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.7),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category['image']!,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 7),
          Text(
            category['name']!,
            style: TextStyle(color: Colors.black, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }).toList();
}


//   Scroll data function
List<Widget> buildItemList(List<Map<String, dynamic>> itemsData) {
  return itemsData.map((item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item['image'],
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['title'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    item['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  SizedBox(width: 5),
                  // Row(
                  //   children: [
                  //     Icon(Icons.star, color: Colors.yellow[700], size: 18),
                  //     SizedBox(width: 2),
                  //     Text(item['rating'].toString(),
                  //         style: TextStyle(fontWeight: FontWeight.bold)),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),

          SizedBox(height: 4),

          Text(
            item['subtitle'],
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }).toList();
}