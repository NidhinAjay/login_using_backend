import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_2b/api.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: const task2a()));
}

class task2b extends StatefulWidget {
  const task2b({Key? key}) : super(key: key);
  @override
  State<task2b> createState() => _task2bState();
}

class _task2bState extends State<task2b> {
  bool check = false;
  bool _isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  void UserRegistration() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "name": nameController.text,
      "address": addressController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "username": usernameController.text,
      "password": passwordController.text,
    };
    print(data);
    var res = await Api().authData(data, '/register');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(res);
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => task2a()));
    } else {
      Fluttertoast.showToast(
          msg: body['message'].toString(), backgroundColor: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Register",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        label: Text("Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        label: Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        label: Text("Phone Number"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          label: Text("E-mail address"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "abc@gmail.com"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                       controller: usernameController,
                      decoration: InputDecoration(
                        label: Text("Username"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          checkColor: Colors.black,
                          value: check,
                          onChanged: (bool? value) {
                            setState(() {
                              check = value!;
                            });
                          }),
                      Text(
                        "I agree with",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Terms and Conditions"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          UserRegistration();
                        },
                        child: Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {

                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => task2a()));
                        },
                        child: Text("Login now",style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
