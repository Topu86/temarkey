import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Login_page.dart';
class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _addressController = TextEditingController();


  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "name":_nameController.text,
      "phone":_phoneController.text,
      "email":_emailController.text,
      "region":_regionController.text,
      "city":_cityController.text,
      "area":_areaController.text,
      "address":_addressController.text,
    }).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (_)=>Login()))).catchError((error)=>print("something is wrong. $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
    //             Container(
    //         height: 150,
    // width: 100,
    // ),
             Padding(
                 padding: EdgeInsets.all(15),
                child: Column(
                 children: <Widget>[
                   Padding(
                   padding: EdgeInsets.all(15),
                       child: TextField(
                     controller: _nameController,
                             decoration: InputDecoration(
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20)),
                       prefixIcon: Icon(Icons.person),
                       filled: true,
                labelText: 'Full Name',
                   hintText: 'Enter Your Full Name',
                ),
                ),
             ),
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
             controller: _phoneController,
              keyboardType: TextInputType.number,
                decoration: InputDecoration(
            filled: true,
          prefixIcon: Icon(Icons.phone),
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Phone Number',
           hintText: 'Enter Your Phone Number',
           ),
        ),
              ),
                   Padding(
                     padding: EdgeInsets.all(15),
                     child: TextField(
                       controller: _regionController,
                       decoration: InputDecoration(
                         filled: true,
                         prefixIcon: Icon(Icons.map),
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                         labelText: 'Region',
                         hintText: 'Enter Your Rigion',
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.all(15),
                     child: TextField(
                       controller: _cityController,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         filled: true,
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                         labelText: 'City',
                         hintText: 'Enter Your City Name',
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.all(15),
                     child: TextField(
                       controller: _areaController,
                       decoration: InputDecoration(
                         filled: true,
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                         labelText: 'Area',
                         hintText: 'Enter Your Area Name',
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.all(15),
                     child: TextField(
                       keyboardType: TextInputType.streetAddress,
                       controller: _addressController,
                       decoration: InputDecoration(
                         filled: true,
                         hoverColor: Colors.deepPurpleAccent,
                         prefixIcon: Icon(Icons.home_sharp),
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                         labelText: 'Address',
                         hintText: 'Enter Your Address',
                       ),
                     ),
                   ),
              ],
            ),
          ),
                TextButton(onPressed: (){sendUserDataToDB();}, child: Text('Save'))
              ]),
      ),
      ))
    );
  }
}