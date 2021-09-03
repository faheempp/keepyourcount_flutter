import 'package:flutter/material.dart';
import 'package:keepyourcount/theme.dart';

class Result extends StatefulWidget {
  get resultTable => [];
  void createResultField(String cardName, int count,){
    resultTable.add([cardName, count]);
  }
  void updateResult(String cardName, int count, int index){
    resultTable[index]=[cardName, count];
  }
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<List> resultTable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Result"),
      ),
      body: Center(
      child: TextButton(
        child: Text("ok"),
        onPressed: (){
          setState((){print(resultTable);});
        },
      )
      ),
    );
  }
}
