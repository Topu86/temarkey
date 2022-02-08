import 'package:flutter/material.dart';
import 'package:tamarket/data/productdatalist.dart';
import 'package:tamarket/model/productmodel.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<User> userlist = uers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.fromLTRB(16, 200, 16, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${userlist[1].name}',
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),

                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage('${userlist[0].image}'),fit: BoxFit.cover)
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 27,),
                      ListTile(title: Text("User Information",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),),
                      ListTile(
                        title: Text('Name'),
                        subtitle: Text('${userlist[1].name}'),
                        leading: Icon(Icons.person),
                      ),
                      ListTile(
                        title: Text('Adress'),
                        subtitle: Text('${userlist[1].adressname}'),
                        leading: Icon(Icons.location_on_outlined),
                      ),
                      ListTile(
                        title: Text('Email'),
                        subtitle: Text('${userlist[1].emailadress}'),
                        leading: Icon(Icons.email),
                      ),
                      ListTile(
                        title: Text('Phone'),
                        subtitle: Text('${userlist[1].phonenumer}'),
                        leading: Icon(Icons.phone),
                      ),
                      ListTile(
                        title: Text('Adout'),
                        subtitle: Text('${userlist[1].adoutdeteils}'),
                        leading: Icon(Icons.perm_contact_cal_rounded),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
            SizedBox(height: 200),

          ],
        ),
      ),
    );
  }
}
