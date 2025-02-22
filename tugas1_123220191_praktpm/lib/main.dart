import 'package:flutter/material.dart';
import 'package:tugas1_123220191_praktpm/Item_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 93, 101, 113)),
      ),
      home: const MyHomePage(title: 'Salar De Uyuni'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 136, 218),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.history, color: Colors.white, size: 23,) )
        ],
      ),

      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.101,),
              Column(
                children: [
                  Icon(Icons.grade),
                  SizedBox(height: 10,),
                   Text("123220191"),
                  Text("Muhammad Essa Pradipta Abrar"),
                ],
              ),
              Divider(),
              ElevatedButton(
                onPressed: (){}, 
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("Tambah Data")
                  ],
                )
              )
            ],
          ),
        ),
      ),

      body:  Stack(
          children: [
            Image(image: AssetImage("assets/images/img.jpg"), fit: BoxFit.cover, height: double.infinity,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ItemCard(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.4,
                  
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Nama"
                              ) ,
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password"
                              ) ,
                            ),
                            
                            SizedBox(height: 20,),
                            ElevatedButton(onPressed: (){}, child: Text("Submit"))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
    

    
    );
  }
}
