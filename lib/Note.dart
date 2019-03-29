import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Note {
  String time;
  String title;
  String notes;
  int color;

  Note({this.time, this.title, this.notes, this.color}){
    if(this.color==null){
      this.color=Colors.yellow[50].value;
    }
  }

  void save() async {
    time = DateTime.now().toIso8601String();
    var sp = await SharedPreferences.getInstance();
    sp.setString('$time-title', title);
    sp.setString('$time-note', notes);
    sp.setInt('$time-color', color);
    List<String> l = sp.getStringList('notes-id') ?? [];
    l.add('$time');
    sp.setStringList('notes-id', l);
  }

  void update() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString('$time-title', title);
    sp.setString('$time-note', notes);
    sp.setInt('$time-color', color);
    List<String> l = sp.getStringList('notes-id') ?? [];
    sp.setStringList('notes-id', l);
  }

  void delete() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString('$time-title', null);
    sp.setInt('$time-color', null);
    sp.setString('$time-note', null);
    List<String> l = sp.getStringList('notes-id') ?? [];
    l.remove('$time');
    sp.setStringList('notes-id', l);
  }
}
