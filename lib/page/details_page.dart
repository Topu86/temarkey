import 'package:flutter/material.dart';
import 'package:tamarket/data/productdatalist.dart';
import 'package:tamarket/model/productmodel.dart';
import 'package:tamarket/page/cart.dart';

import 'confirm_order.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Products> productlist = product();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset('${productlist[0].image}',fit: BoxFit.cover,)),
          SafeArea(child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8),
              child: Row(
                children: [

                ],
              ),
              ),
              Spacer(),
              Expanded(child: Container(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white
                  ),
                  child: Column(
                    children:  [
                      SizedBox(height: 30,),
                      Expanded(child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text('${productlist[0].name}',
                                style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),

                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                            child: Text('${productlist[0].sdetails}',style: TextStyle(fontSize: 25),),
                            ),
                            ExpansionTile(title: Text('Show Details',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(16),
                                child: Text('${productlist[0].details}',style: TextStyle(fontSize: 22),),
                              )
                            ],
                            )

                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  ),
                  color: Colors.deepOrange
                ),
                child: Row(
                  children: [
                    Text('${productlist[0].price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Spacer(),
                    RaisedButton(
                      onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmOrder()),
                      );},
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      color: Colors.yellow,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Text("Bay Now",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(width: 20,),
                        ],),
                    ),
                    SizedBox(width: 9,),
                    RaisedButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cartpage()),
                    );},
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      color: Colors.yellow,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Add To Cart",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          SizedBox(width: 20,),
                        ],),
                    ),
                  ],
                ),
              )
            ],
          )
          )
        ],
      ),
    );
  }
}
