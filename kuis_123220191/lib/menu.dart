import 'package:flutter/material.dart';
import 'package:kuis_123220191/component/Item_card.dart';
import 'package:kuis_123220191/data/data.dart';
import 'package:kuis_123220191/detail.dart';
import 'package:kuis_123220191/profile_page.dart';

class MenuPage extends StatefulWidget {
  final String username;

  const MenuPage({super.key,required this.username});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<ForumPost> items = DummyData.GetDummyData();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
                'Civitas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45
                ),
              ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(username: widget.username,)));
            },
            child: Icon(Icons.person, color: Colors.white,)
          )
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return Column(
                children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: item,)));
                  },
                  child: ItemCard(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("${item.username}", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: Text("${item.post}", style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.75,),
                              Icon(Icons.bookmark_outline, color: Colors.white,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,)
                ],
              );
            },

          )
        ),
      ),
    );
  }
}