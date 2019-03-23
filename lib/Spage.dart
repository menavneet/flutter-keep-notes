import 'package:flutter/material.dart';
import 'base.dart';

class Spage extends StatefulWidget {
  @override
  _SpageState createState() => _SpageState();
}

class _SpageState extends State<Spage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream:BaseWidget.of(context).bloc.stream,
          builder: (context,snapshot)=>Text(snapshot.data),
        )
      ),
    );
  }
}