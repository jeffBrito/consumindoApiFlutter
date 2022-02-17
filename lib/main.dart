import 'package:flutter/material.dart';
import 'package:smartolt/my_widget.dart';

void main() {
  runApp(SmartApp());
}

class SmartApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartOlt',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumindo API - No Flutter'),
        ),
        body: SmartFulWidget(),
      ),
    );
  }

}

