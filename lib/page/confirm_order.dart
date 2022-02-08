import 'package:flutter/material.dart';
import 'package:tamarket/data/productdatalist.dart';
import 'package:tamarket/model/productmodel.dart';
class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  List<Products> productlist = product();
  List<User> userlist = uers();

  bool _address = false;
  int val = -1;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Confirm Order"),centerTitle: true,),
      body: _buildBody(context),
    );
  }
  Widget _buildBody(BuildContext context){
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 10),
      child: Column(

        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('Subtotal :'),
             Text('${productlist[0].subtotal}'),],),
          SizedBox(height: 9,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery fee :  '),
              Text('${productlist[0].deliveryfee}'),],),
          SizedBox(height: 9,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total :',style: Theme.of(context).textTheme.headline6,),
              Text('${productlist[0].totalprice}',style: Theme.of(context).textTheme.headline6,),],),
          SizedBox(height: 20,),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: Text("Deliver Address".toUpperCase()),
          ),
          Column(
            children: [
              RadioListTile(
                value: _address,
                groupValue: _address,
                onChanged: (value) {
                  setState(() {
                    val = _address as int;
                  });
                },
                selected: _address,
                title: Text('${userlist[0].adressname}'),
              ),
              RadioListTile(value: 'New Address',
                  groupValue: _address,
                onChanged: (value) {
                  setState(() {
                    val = _address as int;
                  });
                },
              title: Text('Choosc new delivery address'),
                selected: _address,
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Text("Contact Number".toUpperCase()),
              ),
             RadioListTile(
               title: Text('${userlist[0].phonenumer}'),
                 value: _address,
                 groupValue: _address,
                 onChanged: (dynamic value){}),
              RadioListTile(value: 'New Phone Number',
                groupValue: _address,
                onChanged: (value) {
                  setState(() {
                    val = _address as int;
                  });
                },
                title: Text('Choosc new contact numder'),
                selected: _address,
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Text("payment Option".toUpperCase()),
              ),
              Column(
                children: [
                  RadioListTile(
                    value: _address,
                    groupValue: _address,
                    onChanged: (value) {
                      setState(() {
                        val = _address as int;
                      });
                    },
                    selected: _address,
                    title: Text('Cash on Delivery'),
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.deepOrange,
                      child: Text("Confirm Order",style: TextStyle(color: Colors.white,fontSize: 25),),
                      onPressed: (){},
                    ),
                  )
            ],
          )
        ],
      ),
    ]));
  }
}
