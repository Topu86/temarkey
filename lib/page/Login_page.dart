import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'homepage.dart';
import 'mainhome.dart';
import 'regitation.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signIn()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>BottomNavigationBarClass()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");

      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 300,
          width: 300,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Email & Phone Number',
              hintText: 'Enter Your Email & Phone Number',
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
              }, icon: Icon(Icons.visibility,size: 20,)),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Password',
              hintText: 'Enter Password',
            ),
          ),
        ),
        RaisedButton(
          padding: EdgeInsets.all(2),
          textColor: Colors.white,
          color: Colors.blue,
          child: Text('Login',style: TextStyle(fontSize: 26),),
          onPressed: (){signIn();},
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Does not have account?',style: TextStyle(fontSize: 20)),
          TextButton(
            child: const Text(
              'Registration',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Singup()),
              );
            },
          )
      ],
      ),
    ])
    );
  }
}
