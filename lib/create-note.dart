import 'package:flutter/material.dart';
import 'Note.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  Note note = Note();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
        actions: <Widget>[
          IconButton(
            onPressed: () {}, //Delete Button
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onSaved: (s) => note.title = s,
                  validator:(s)=>(s.length>5?null:'Note A Valid Title'),
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
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 10,
                  maxLength: 1000,
                  style: Theme.of(context).textTheme.subtitle,
                  decoration: InputDecoration.collapsed(hintText: 'Write Note'),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          if(formKey.currentState.validate()){
          formKey.currentState.save();  
          note.save();
          Navigator.pop(context);
          }
        }, //Save Button
        child: Icon(
          Icons.save,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
