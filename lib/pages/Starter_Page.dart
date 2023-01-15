import 'package:flutter/material.dart';
import 'package:foot_app/pages/Home_Page.dart';
import '../animations/animations.dart';
import 'package:page_transition/page_transition.dart';
class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
 late Animation<double> _animation;

 bool _textVisble =true;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: 1.0,
    end: 25.0,
    ).animate(_animationController);
    super.initState();
  }
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  void _onTap(){
    setState(() {
      _textVisble =false;
    });
    _animationController.forward().then((f) =>
    Navigator.push(context,
        PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(),
        )
    )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Animations(.5, Text('Al-Qudsi  Restaurant for Al Zabyan and snacks',
                style: TextStyle(fontSize: 50,
                fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
          ),
                SizedBox(height: 20,),
                // Text('Restaurant location: Beihan Street',
                // style: TextStyle(
                //   color: Colors.white,
                //   height: 1.0,
                //   fontSize: 20,
                // ),
                // ),
                SizedBox(height: 50,),
            Animations(1.2,
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.orangeAccent,
                              Colors.redAccent
                            ]
                        )
                    ),
                    child:AnimatedOpacity(
                      opacity: _textVisble ?1.0 :0.0,
                      duration: Duration(milliseconds: 50),
                      child:TextButton(
                          onPressed:() => _onTap(),
                          child: Text(
                            'Go',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                      ),

                    ),

                  ),
                ),
                ),

                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
