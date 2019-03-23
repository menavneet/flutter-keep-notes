import 'package:flutter/material.dart';
import 'base.dart';

class ShowNote extends StatelessWidget {
  final int index;
  ShowNote({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notes'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(BaseWidget.of(context).bloc.l[index].title),
          ),
          Text(BaseWidget.of(context).bloc.l[index].notes)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.backspace),
      ),
    );
  }
}
