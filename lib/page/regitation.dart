import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamarket/page/Login_page.dart';
import 'package:tamarket/page/userfrom.dart';



class Singup extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Singup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _confrompassword = TextEditingController();
  bool _obscureText = true;

  signUp()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");

      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
        body: Column(
          children: [
            Container(height: 300,),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: 'E-mail adress',
                  hintText: 'Enter E-mail adress',
                ),
              ),
            ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(

                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          suffixIcon: _obscureText == true
                            ? IconButton(onPressed: (){
                              setState(() {
                                _obscureText = false;
                              });
                          },
                              icon: Icon(Icons.visibility_off,size: 20,))
                              : IconButton(onPressed: (){
                                setState(() {
                                  _obscureText =true;
                                });
                          }, icon: Icon(Icons.visibility,size: 20,))
                        ),
                      ),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Registration',style: TextStyle(fontSize: 20),),
                      onPressed: () {
                        signUp();
                      },
                    )
                  ],
                )
    );
  }
}