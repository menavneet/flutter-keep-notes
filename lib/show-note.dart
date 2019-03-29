import 'package:flutter/material.dart';
import 'note.dart';
import 'edit-note.dart';

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
        color: Color(note.color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              note.title,
              style: Theme.of(context).textTheme.title,
            ),
            Divider(),
            Text(note.notes, style: Theme.of(context).textTheme.subtitle)
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   backgroundColor: Theme.of(context).buttonColor,
      //   child: Icon(Icons.backspace,color: Theme.of(context).iconTheme.color),
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // FlatButton(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       Icon(Icons.delete),
            //       Text('Delete'),
            //     ],
            //   ),
            //   onPressed: () {},
            //),
            FlatButton(
              child: Row(
              
                children: <Widget>[
                  Icon(Icons.edit,color: Theme.of(context).iconTheme.color,),
                  Text('Edit'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNote(note: note)));
              },
            ),
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.cancel,color: Theme.of(context).iconTheme.color,),
                  Text('Back'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
