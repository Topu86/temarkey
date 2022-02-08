import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tamarket/data/productdatalist.dart';
import 'package:tamarket/model/productmodel.dart';
import 'package:tamarket/page/cart.dart';
import 'package:tamarket/page/details_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Products> productlist = product();
  List<Fproduct> productss = producter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepOrange,
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Welcome To shop',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             background: Image.asset('images/d.jpg',fit: BoxFit.fill,),

            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.deepOrange,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    MaterialButton(onPressed: (){},
                    child: Text('New Arrival',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Spacer(),
                    MaterialButton(onPressed: (){},
                      child: Text('See All',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(left: 16,right: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildltems(index,context);
                },
              childCount: productlist.length,
            ),
          ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.deepOrange,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    MaterialButton(onPressed: (){},
                      child: Text('Featured',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Spacer(),
                    MaterialButton(onPressed: (){},
                      child: Text('See All',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _buildSlider(),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text('Recommended for you'.toUpperCase(),
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return _buildListItem(index);
              },
            childCount: productlist.length
          ))
        ],

      ),
    );
  }
  Widget _buildSlider(){
    return GestureDetector(
      onTap: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Details()),
    );},
      child: Container(
        padding:  const EdgeInsets.only(bottom: 20.0),
        height: 200,
        child: Container(child: Swiper(
          autoplay: true,
          autoplayDelay: kDefaultAutoplayDelayMs,
          itemCount: productss.length,
          pagination: SwiperPagination(),
          itemBuilder: (context, index) {
            return Image.asset('${productss[index].images}',fit: BoxFit.cover,);
          },
        ),),
      ),
    );
  }
  Widget _buildltems(int index, BuildContext context){
    return Container(
      height: 10,
      child: GestureDetector(
        onTap: ()=> _onTapItem(context, index),
        child: Column(
          children: [
            Expanded(
                child: Hero(
              tag: "item$index",
              child: Image.asset('${productlist[index].image}',fit: BoxFit.cover,),
            )),
            SizedBox(height: 10,),
            Text('${productlist[index].name}',softWrap: true,),
            SizedBox(height: 10,),
            Text('${productlist[index].price}',style: TextStyle(
              fontSize: 19,fontWeight: FontWeight.bold,color: Colors.red
            ),),

          ],
        ),
      ),
    );
  }
  Widget _buildListItem(int index){
    return GestureDetector(
      onTap: (){ Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Details()),
      );},
      child: Container(
        height: 100,
        child: Card(
          child: Center(
            child: ListTile(
              trailing:
                IconButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cartpage()),
                );},
              tooltip: "Cart",
              icon: Icon(Icons.shopping_cart_sharp)),
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('${productlist[index].image}'),),
              title: Text('${productlist[index].name}',softWrap: true,),
              subtitle: Text('${productlist[index].price}',style: TextStyle(
                  fontSize: 19,fontWeight: FontWeight.bold,color: Colors.red
              ),),
            ),

          ),
        ),
      ),
    );
  }
  _onTapItem(BuildContext pcontext,int index){
    Navigator.of(pcontext).push(MaterialPageRoute<void>(builder:
        (BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('${productlist[index].name}'),),
        body: Material(
          child: Container(
            child: GestureDetector(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Details()),
              );},
              child:  Column(
                children:[
                  Expanded(
                  child: Hero(
                    tag: "item$index",
                    child: Image.network('${productlist[index].image}',fit: BoxFit.cover,))),
                  SizedBox(height: 10,),
                  Text('${productlist[index].name}',softWrap: true,),
                  SizedBox(height: 10,),
                  Text('${productlist[index].price}',style: TextStyle(
                      fontSize: 19,fontWeight: FontWeight.bold,color: Colors.red
                  ),),
                  Icon(Icons.shopping_cart)
                ],
              )),

          ),
        ),
      );
    }));
  }
}
