import 'package:flutter/material.dart';
import 'package:kuis_123220191/component/Item_card.dart';
import 'package:kuis_123220191/data/data.dart';

class DetailPage extends StatefulWidget {
  final ForumPost item;

  const DetailPage({
    super.key,
    required this.item
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
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
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemCard(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("   ${widget.item.username}", style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(child: Text("   ${widget.item.post}", style: TextStyle(color: Colors.white),)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: widget.item.image == null ?  Column(
                                children: [
                                  SizedBox(height: 100,),
                                  Icon(Icons.warning, color: Colors.white,),
                                  SizedBox(height: 100,),
                                ],
                              ) : Image.network(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.height * 0.325,
                                widget.item.image!,
                                fit: BoxFit.cover
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.white,),
                                  Text("${widget.item.vote.upvote}", style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              SizedBox(width: 150,),
                              Row(
                                children: [
                                  Icon(Icons.arrow_downward, color: Colors.white,),
                                  Text("${widget.item.vote.downvote}", style: TextStyle(color: Colors.white),)
                                ],
                              )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Komentar", style: TextStyle(color: Colors.white),),
                    ItemCard(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        itemCount: widget.item.comments.length,
                        itemBuilder: (context, index) {
                          var komen = widget.item.comments[index];
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ItemCard(
                              width: 400,
                              height: 150,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        SizedBox(width: 20,),
                                        Text("${komen.username}", style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        SizedBox(width: 20,),
                                        Expanded(child: Text("${komen.comment}", style: TextStyle(color: Colors.white))),
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          Row(
                                        children: [
                                          Icon(Icons.arrow_upward, color: Colors.white,),
                                          Text("${komen.vote.upvote}", style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                      SizedBox(width: 130,),
                                      Row(
                                        children: [
                                          Icon(Icons.arrow_downward, color: Colors.white,),
                                          Text("${komen.vote.downvote}", style: TextStyle(color: Colors.white),)
                                        ],
                                      )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                      },),
                    )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}