import 'package:flutter/material.dart';
import 'package:tamarket/data/productdatalist.dart';
import 'package:tamarket/model/productmodel.dart';

import 'confirm_order.dart';
class cartpage extends StatefulWidget {
  const cartpage({Key? key}) : super(key: key);

  @override
  _cartpageState createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  List<Products> productlist = product();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.deepOrange,
        title: Text('My Cart',),centerTitle: true,),
      body: Column(
        children: [
          Flexible(child: ListView.builder(
            itemCount: productlist.length,
              itemBuilder:(context,int index){
                return cartItems(index);
              }
          )),
          _checkoutSection()
        ],
      ),
    );
  }
  Widget cartItems(int index){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 130,
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('${productlist[index].image}'),fit: BoxFit.cover)
            ),
          ),
          Flexible(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(child: Text('${productlist[index].name}'+index.toString(),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              )),
                    Container(child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete,size: 20,color: Colors.deepOrange,),

                    ),)
                  ],
                ),
                Row(
                  children: [
                    Text('${productlist[index].price}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text('${productlist[index].pricename}',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                    Text('${productlist[index].totalprice}',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Ships Free :',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                    Text('80',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                    Spacer(),
                   InkWell(
                     onTap: (){},
                     child: Icon(Icons.remove,color: Colors.red,),
                   ),
                    SizedBox(width: 4,),
                    Card(child: Text('2',style: TextStyle(fontSize: 20),),),
                    InkWell(
                      onTap: (){},
                      child: Icon(Icons.add,color: Colors.green,),
                    ),
                  ],
                ),

              ],
            ),
            
          ))
        ],
      ),
    );
  }
  Widget _checkoutSection(){
    return Material(
      color: Colors.grey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text('Checkout Price :  ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            Spacer(),
                Text('500',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
          child: Material(
            color: Colors.deepOrange,
            elevation: 1,
            child: InkWell(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmOrder()),
              );},
              splashColor: Colors.redAccent,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Checkout',textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
                ),
              ),
            ),
          ),
          )
        ],
      ),
    );
  }
}
