import 'package:flutter/material.dart';
import 'package:keepyourcount/result.dart';
import 'package:keepyourcount/widgets/countCard.dart';
import 'package:keepyourcount/theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class KeepYourCount extends StatefulWidget {
  @override
  State<KeepYourCount> createState() => _KeepYourCountState();
}

class _KeepYourCountState extends State<KeepYourCount> {
  int cardCount = 1;

  @override
  Widget build(BuildContext context) {

    List<Widget> cards = new List.generate(
        cardCount,
        (int i) => new CountCard(
            cardColors[i % cardColors.length], "Card " + (i + 1).toString(),i));

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primary,
            title: Title(
              child: Text(
                "keep.your.count",
                style: TextStyle(
                  fontFamily: "Sacramento",
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  letterSpacing: .5,
                ),
              ),
              color: Colors.white,
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(vertical: 0,horizontal:10),
            physics: BouncingScrollPhysics(),
            // crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            children: cards,
          ),
          bottomNavigationBar: NavBar(context),
        ));
  }
  //NavBar-----------------------------------------NavBar-------------------------------NavBar-----------------
  NavBar(BuildContext context) {
    double iconSize = 30;
    return Container(
      //width: 50,//MediaQuery.of(context).size.width*.8,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          icon: Icon(
            Icons.delete,
            size: iconSize,
            color: Colors.grey[400],
          ),
          onPressed: () {
            confirmationAlert(context);
          },
          splashColor: Colors.white,
        ),
        IconButton(
          icon: Icon(Icons.add, size: iconSize,color: Colors.grey[400]),
          onPressed: () {
            setState(() {
              cardCount++;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.list_alt_rounded, size: iconSize,color: Colors.grey[400]),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Result();
            }));
          },
        ),
      ]),
      decoration: BoxDecoration(
        color: primary,
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: <Color>[
        //     Color(0xFF162A29),
        //     Color(0xFF26403D),
        //     Color(0xFF162A29),
        //   ],
        // ),
      ),
    );
  }

  confirmationAlert(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Delete All"),
          content: Text("Are you sure?",
            style:TextStyle(
              fontSize: 23,
            ),),
          actions: [
            TextButton(
              child: Text("Yes",style:TextStyle(
                fontSize: 19,
                color: Colors.white
              ),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF263238)),

              ),
              onPressed: (){
                setState((){
                  cardCount=0;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("No", style:TextStyle(
                  fontSize: 19,
                  color: Color(0xFF263238),
              ),
              ),
              style: ButtonStyle(
                side:  MaterialStateProperty.all(BorderSide(
                  width:2,
                  color:Color(0xFF263238),
                ))
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

