import 'package:flutter/material.dart';
import 'package:tugas2_123220191/custom_button.dart';
import 'package:tugas2_123220191/custom_textfield.dart';
import 'package:tugas2_123220191/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tugas2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 26, 47)),
      ),
      home: const MyHomePage(title: 'Tugas 2'),
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

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _check(){
    if(_username.text == "Abrar" && _password.text == "123220191"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(username: _username.text,)));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username atau password salah !",), backgroundColor: const Color.fromARGB(255, 249, 0, 0),),
      );
    }
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
      ),

      body: Center(
        
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(57, 86, 86, 86),
            borderRadius: BorderRadius.circular(10)
          ),
          height: 300,
          width: 300,

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("LOGIN", style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 20,),
              
                  CustomTextfield(controller: _username, hintText: "Username"),
                  SizedBox(height: 20,),
              
                  CustomTextfield(controller: _password, hintText: "Password", sembunyikan: true,),
                  SizedBox(height: 50,),
              
                  customButton(
                    title: "LOGIN",
                    radius: 8,
                    warnaBackground: const Color.fromARGB(255, 250, 188, 0),
                    warnaText: Colors.white,
                    warnaBorder: const Color.fromARGB(0, 188, 3, 3),
                    tebalFont: FontWeight.bold,
                    fungsiKetikaDitekan: _check
                  )
              
                ],
              ),
            ),
          ),
        )
      ),


    );
  }
}
