import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'note.dart';
import 'show-note.dart';
class NoteTile extends StatelessWidget {
  final Note note;
  const NoteTile({
    Key key,
    this.note
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
        onDismissed: (d)=>note.delete(),
        background: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete,color: Colors.white70,),
          decoration: BoxDecoration(color: Colors.red[300]
          ),
        ),
        confirmDismiss: (direction) {
          return showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Delete ?"),
                  content:
                      Text('Are you really want to delete'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () =>
                          Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text('Confirm'),
                      onPressed: () =>
                          Navigator.of(context).pop(true),
                    )
                  ],
                );
              });
        },
         key: Key(note.time),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).buttonColor,
            child: Icon(Icons.edit),
          ),
          title: Text(note.title),
          onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return ShowNote(note: note);
              })),
          subtitle: Text(
            timeago.format(DateTime.now().subtract(DateTime.now().difference(DateTime.parse(note.time))))
          ),
        ),);
  }
}
