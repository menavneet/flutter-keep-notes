import 'package:shared_preferences/shared_preferences.dart';
class Note{
  String time;
  String title;
  String notes;

  Note({this.time,this.title,this.notes});

  void save()async{
    time=DateTime.now().microsecondsSinceEpoch.toString();
    var sp=await SharedPreferences.getInstance();
    sp.setString('$time-title',title);
    sp.setString('$time-note', notes);
    List<String> l=sp.getStringList('notes-id')??[];
    l.add('$time');
    sp.setStringList('notes-id', l);
  }

  void delete()async{
    var sp=await SharedPreferences.getInstance();
    sp.setString('$time-title',null);
    sp.setString('$time-note',null);
    List<String> l=sp.getStringList('notes-id')??[];
    l.remove('$time');
    sp.setStringList('notes-id', l);

  }

}