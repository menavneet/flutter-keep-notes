import 'package:flutter/material.dart';
import 'note.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  Note note = Note();
  var formKey = GlobalKey<FormState>();

  void changeColor(Color c) {
    setState(() {
      this.note.color = c.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        color: Color(note.color),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onSaved: (s) => note.title = s,
                  validator: (s) => (s.length > 2 ? null : 'Write Something'),
                  maxLength: 50,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.title,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Title',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (s) => note.notes = s,
                  validator: (s) => s.length > 2 ? null : 'Write Some Note',
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 10,
                  maxLength: 1000,
                  style: Theme.of(context).textTheme.subtitle,
                  decoration: InputDecoration.collapsed(hintText: 'Write Note'),
                ),
                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          changeColor(Colors.red[50]);
                        },
                        icon: Icon(Icons.palette),
                        color: Colors.black26,
                      ),
                      backgroundColor: Colors.red[50],
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          changeColor(Colors.yellow[50]);
                        },
                        icon: Icon(Icons.palette),
                        color: Colors.black26,
                      ),
                      backgroundColor: Colors.yellow[50],
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          changeColor(Colors.green[50]);
                        },
                        icon: Icon(Icons.palette),
                        color: Colors.black26,
                      ),
                      backgroundColor: Colors.green[50],
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          changeColor(Colors.blue[50]);
                        },
                        icon: Icon(Icons.palette),
                        color: Colors.black26,
                      ),
                      backgroundColor: Colors.blue[50],
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          changeColor(Colors.orange[50]);
                        },
                        icon: Icon(Icons.palette),
                        color: Colors.black26,
                      ),
                      backgroundColor: Colors.orange[50],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              }, //Cancel Button

              child: Row(
                children: <Widget>[Icon(Icons.cancel,color: Theme.of(context).iconTheme.color,),SizedBox(width: 3,), Text('Cancel')],
              ),
            ),
            FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  note.save();
                  Navigator.pop(context);
                }
              }, //Save Button

              child: Row(
                children: <Widget>[Icon(Icons.save,color: Theme.of(context).iconTheme.color,),SizedBox(width: 3,),Text('Save')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
