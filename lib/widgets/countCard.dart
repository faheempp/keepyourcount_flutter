import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keepyourcount/result.dart';

class CountCard extends StatefulWidget {
  List bgcolor;//=Colors.lightGreen[100];
  String cardLabel;
  int cardNo;
  CountCard(this.bgcolor,this.cardLabel,this.cardNo);
  @override
  CountCardState createState() => CountCardState();
}

class CountCardState extends State<CountCard> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    //Result().createResultField(widget.cardLabel, counter);
    return Container(
      margin: EdgeInsets.symmetric(vertical:8,horizontal: 8),
      decoration: BoxDecoration(
        //boxShadow: BoxShadow(offset: 12,color: Colors.black)
        gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.bgcolor,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow:[ BoxShadow(
               color: Color(0xFF0F2D2A),
               offset: Offset(.2,0.2),
               blurRadius: 3,
               spreadRadius: .3,
        ),
      ],
      ),
     // width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.height * .20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: widget.cardLabel,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  child: Text('-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFACACAD),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0C1F2B),
                    onPrimary:Color(0xFFE0E3F3),
                    elevation: 10,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      counter--;
                     //Result().updateResult(widget.cardLabel, counter,widget.cardNo);
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (counter>0)
                        counter=0;
                      else
                        counter-=10;
                     // Result().updateResult(widget.cardLabel, counter,widget.cardNo);
                    });
                  },
                  ),
              Container(
                width: 125,
                child: Text(
                  counter.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 55),
                ),
              ),
              ElevatedButton(
                child: Text('+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFFACACAD),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0C1F2B),
                  onPrimary:Color(0xFFE0E3F3),
                  elevation: 10,
                  shape: CircleBorder(),
                ),
                onPressed: () {
                  setState(() {
                    counter++;
                    //Result().updateResult(widget.cardLabel, counter,widget.cardNo);
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (counter>=0)
                      counter+=10;
                    else
                      counter=0;
                    //Result().updateResult(widget.cardLabel, counter,widget.cardNo);
                  });
                },
              ),
              // IconButton(
              //   padding: EdgeInsets.all(0),
              //   icon: Icon(
              //     Icons.add_box,
              //     size: 55,
              //   ),
              //   onPressed: () {
              //     setState(() {
              //       counter++;
              //     });
              //   },
              //   highlightColor: Colors.red,
              //   splashColor: Colors.red,
              //   hoverColor: Colors.green,
              //   splashRadius: 10,
              // ),
            ],
          ),

          // IconButton(
          //     padding: EdgeInsets.only(top: 10),
          //     icon: Icon(
          //       Icons.replay,
          //       size: 40,
          //     ),
          //     onPressed: () {
          //       setState(() {
          //         counter = 0;
          //       });
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //             content: Text("Reset")
          //         ),
          //       );
          //     }),
        ],
      ),
    );
  }
}
