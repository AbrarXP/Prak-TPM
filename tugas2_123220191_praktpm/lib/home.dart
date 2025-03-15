import 'package:flutter/material.dart';
import 'package:tugas2_123220191/detail.dart';
import 'package:tugas2_123220191/main.dart';

class HomePage extends StatefulWidget {
  final String? username;

  const HomePage({
    super.key,
    this.username
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Selamat datang kembali ${widget.username}"),
          backgroundColor: const Color.fromARGB(255, 13, 236, 6),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 33, 33, 33),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 204, 0),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera, color: Colors.white,), 
            Text(
              " GALLERY", 
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 23
              ),
            ),
          ]
        ),

        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Icon(Icons.warning),
                    content: Text("Apakah anda yakin untuk logout?."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); 
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "",)));
                        },
                        child: Text("Ya"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                        child: Text("Batalkan"),
                      ),
                    ],
                  );
                }
              );
            },
            child: Icon(Icons.logout,color: Colors.white,)
          )
        ],

        actionsPadding: EdgeInsets.only(right: 10),
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ), 

        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => detailPage(url: 'https://picsum.photos/200/300?random=$index', index: "${index+1}",)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(12, 254, 254, 254),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'https://picsum.photos/200/300?random=$index',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Text("Gambar ${index+1}", style: TextStyle(color: Colors.white),)
                  ],
                )
              ),
            ),
          );

        },
        
      ),

    );
  }
}