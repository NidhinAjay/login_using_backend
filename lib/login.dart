import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_2b/main.dart';
import 'package:task_2b/profile.dart';

import 'api.dart';


class task2a extends StatefulWidget {
  const task2a({Key? key}) : super(key: key);

  @override
  State<task2a> createState() => _task2aState();
}

class _task2aState extends State<task2a> {

  bool _isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  void UserLogin() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };
    print(data);
    var res = await Api().authData(data, '/login');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => bio()));
    } else {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor:Colors.blueGrey,
                  radius: 75,
                  child: Icon(Icons.person,size: 150,color: Colors.white,),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding:EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      label: Text("Email"),border:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding:EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      label: Text("Password"),suffixIcon:Icon(Icons.remove_red_eye),border:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(height: 40,
                  width: 120,
                  decoration:BoxDecoration(color:Colors.blue,borderRadius:BorderRadius.circular(20),),
                  child: TextButton(onPressed: (){
                    UserLogin();
                  }, child: Text("Login now",style:TextStyle(color:Colors.white),),),
                ),
                SizedBox(height: 20,),
                TextButton(onPressed: (){}, child: Text("Forgot password?",style:TextStyle(color:Colors.black),),),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",style:TextStyle(color:Colors.black),),
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>task2b()));
                    }, child: Text("Sign up now",style:TextStyle(color:Colors.blue),),)
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
