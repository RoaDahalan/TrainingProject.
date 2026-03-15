import 'package:flutter/material.dart';
import 'package:training_project/Commons/CommonMethods.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //  هاد خاص للكاتيجوريز
    List<Map<String, String>> categoriesData = [
      {
        'name': 'Senima',
        'image': 'assets/senima.png',
      },
      {
        'name': 'Music',
        'image': 'assets/guitar.png',
      },
      {
        'name': 'Breakfast',
        'image': 'assets/24-Breakfast.png',
      },
      {
        'name': 'Senima',
        'image': 'assets/senima.png',
      },
      {
        'name': 'Music',
        'image': 'assets/guitar.png',
      },
    ];


    //  هاد خاص لعناصر الهوم
    List<Map<String, dynamic>> itemsData = [
      {
        'title': 'Service Category',
        'subtitle': 'New Music Event on Dubai Botek for Valentine Day',
        'image': 'assets/image.png',
        'isFavorite': false,
      },
      {
        'title': 'Service Category',
        'subtitle': 'New Music Event on Dubai Botek for Valentine Day',
        'image': 'assets/image.png',
        'isFavorite': true,
      },
      {
        'title': 'Hall Category',
        'subtitle': 'New Music Event on Dubai Botek for Valentine Day',
        'image': 'assets/image.png',
        'isFavorite': false,
      },
    ];


    List<Map<String, dynamic>> filteredItems = [];
    TextEditingController searchController = TextEditingController();

    @override
    void initState() {
      super.initState();
      filteredItems = itemsData;
    }

    void updateSearch(String query) {
      setState(() {
        filteredItems = itemsData.where((item) =>
        item['title'].toLowerCase().contains(query.toLowerCase()) ||
            item['subtitle'].toLowerCase().contains(query.toLowerCase())
        ).toList();
      });
    }



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
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 70 , bottom: 20 , left: 20 , right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi Mohammed' ,
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold , fontSize: 30),),
                        Text('Welcome back, where you wanna do in occasion today?' ,
                          style: TextStyle(color: Colors.white, fontSize: 22),),
                      ]
                  ),
                ),

                DraggableScrollableSheet(
                  initialChildSize: 0.73,
                  minChildSize: 0.73,
                  maxChildSize: 0.73,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      width: 375,
                      height: 556,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      ),


                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ListView(
                          controller: scrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: buildCategoryContainers(categoriesData),
                              ),
                            ),

                            ...buildItemList(filteredItems),
                          ],
                        ),
                      ),


                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 210 , left: 30 , right: 30),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: updateSearch,
                      decoration: InputDecoration(
                        hintText: 'Find Event, space, volunteer...',
                        prefixIcon: Icon(Icons.search_outlined , color: Color(0xFFAF8344) , size: 27,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}