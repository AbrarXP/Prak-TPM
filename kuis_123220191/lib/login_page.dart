import 'package:flutter/material.dart';
import 'package:kuis_123220191/component/custom_button.dart';
import 'package:kuis_123220191/component/custom_textfield.dart';
import 'package:kuis_123220191/menu.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _user = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  void _check(){
    if(_user.text == "admin" && _pass.text == "123"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPage(username: _user.text,)));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username atau password salah !",), backgroundColor: const Color.fromARGB(255, 249, 0, 0),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 160,),
              Row(children: [
                SizedBox(width: 60,),
                Text(
                'Civitas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 65
                ),
              )
              ],),
              Row(children: [
                SizedBox(width: 160,),
                Text(
                'UPNVYK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
              )
              ],),
              SizedBox(
                height: 50,
              ),
              CustomTextfield(
                hintText: "Username",
                controller: _user,
              ),
              SizedBox(height: 20,),
               CustomTextfield(
                hintText: "Password",
                controller: _pass,
              ),
              SizedBox(height: 50,),
              customButton(
                title: "LOGIN",
                fungsiKetikaDitekan: _check,
              )
            ],
          ),
        ),
      ),
    );
  }
}