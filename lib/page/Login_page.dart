import 'package:flutter/material.dart';
import 'regitation.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Phone Number',
              hintText: 'Enter Your Phone Number',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.visibility),
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
          onPressed: (){},
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
