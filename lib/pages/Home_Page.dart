import 'package:flutter/material.dart';

import '../animations/animations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.shopping_basket,
                color:Colors.grey[800]
              ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Animations(1,Text('Food Delivery',
                  style: TextStyle(
                    color:Colors.grey[80],
                    fontSize:40,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Animations(1,makeCategory(isActive:true,title:'Pizaa')),
                        Animations(1.3,makeCategory(isActive:false,title:'Burgers')),
                        Animations(1.4,makeCategory(isActive:false,title:'Kabab')),
                        Animations(1.5,makeCategory(isActive:false,title:'Desert')),
                        Animations(1.6,makeCategory(isActive:false,title:'Salas')),
                      ],
                    ),
                  ),
                  SizedBox(height:10 ,),
                ],
              ),
            ),
            Animations(1,
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Free Delivery',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                )),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Animations(2.4, makeItem(image: 'assets/images/patzz.jpg')),
                      Animations(2.5, makeItem(image: 'assets/images/patzz.jpg')),
                      Animations(2.6, makeItem(image: 'assets/images/patzz.jpg')),
                    ],
                  ),
                )
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),

    );


  }
  Widget makeCategory({isActive, title}){
    return AspectRatio(aspectRatio: isActive? 3 : 2.5/1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ?Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Align(
          child: Text(title,style: TextStyle(
            color: isActive ? Colors.white :Colors.grey[500],
            fontSize: 20,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
          ),),
        ),
      ),
    );
  }
  Widget makeItem({image}){
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image:DecorationImage(
                  image: AssetImage(image),
                      fit: BoxFit.cover,
              )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3)
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$ 15.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 10,),
                      Text("Vegetarian Pizza",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        ),
      ),

    );
  }
}
