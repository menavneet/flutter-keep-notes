import 'package:flutter/material.dart';
import 'note.dart';

class ShowNote extends StatelessWidget {
  final Note note;
  ShowNote({this.note});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notes'),
      ),
      body: Container(
         padding: EdgeInsets.all(8),
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(note.title,style: Theme.of(context).textTheme.title,),
            Divider(),
            Text(note.notes,style: Theme.of(context).textTheme.subtitle)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(Icons.backspace,color: Theme.of(context).iconTheme.color),
      ),
    );
  }
}
