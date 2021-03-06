import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  int counter = 0;
  bool showBadge = true;


  Widget showBadgeCart(){
    return Badge(
      showBadge: true,
      shape: BadgeShape.square,
      badgeColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.scale,
      position: BadgePosition.topEnd(top: 0, end: 3),
      badgeContent: Text(counter.toString()),
      borderRadius: BorderRadius.circular(10),
      child: Icon(Icons.shopping_cart,size: 50,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badges Demo'),
        centerTitle: true,
        leading: Badge(
          showBadge: true,
          badgeColor: Colors.purpleAccent,
          shape: BadgeShape.circle,
          child: Icon(Icons.menu),
          position: BadgePosition.topEnd(top: 0,end: 3),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            _showRaisedButton(),
            SizedBox(height: 20,),
            Container(
              height: 100,
              width: 100,
              child: showBadgeCart(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              RaisedButton(
                  child: Text('Add More'),
                  color: Colors.grey.shade400,
                  onPressed: (){
                    setState(() {
                      counter++;
                    });
                  }
              ),
                RaisedButton(
                  color: Colors.grey.shade400,
                  child: Text('Remove items'),
                  onPressed: (){
                    setState(() {
                      if(counter > 0){
                        counter--;
                      }
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _showRaisedButton(){
    return Badge(
      showBadge: showBadge,
      position: BadgePosition.topEnd(top: 0,end: 3),
      badgeColor: Colors.red,
      badgeContent: Text('!',style: TextStyle(fontSize: 20,color: Colors.white),),
      child: RaisedButton.icon(
          onPressed:(){
            setState(() {

              showBadge = !showBadge;
            });
          },
          icon: Icon(Icons.bug_report),
          label: Text('Show Badge OR Not'),
      )
    );
  }
}












