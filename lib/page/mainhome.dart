
import 'package:flutter/material.dart';
import 'package:tamarket/page/cart.dart';
import 'package:tamarket/page/homepage.dart';
import 'package:tamarket/page/profile.dart';
class BottomNavigationBarClass extends StatefulWidget {
  const BottomNavigationBarClass({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarClassState createState() => _BottomNavigationBarClassState();
}

class _BottomNavigationBarClassState extends State<BottomNavigationBarClass> {
  var _curIndex=0;
  List _curPage=[
    HomePage(),
    cartpage(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap: (int index){
          setState(() {
            _curIndex=index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _curPage[_curIndex],
    );
  }
}
