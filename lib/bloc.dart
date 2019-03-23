import 'dart:async';
import 'Note.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Bloc {
List<Note> l;
void refresh()async{
  var sp=await SharedPreferences.getInstance();
  l=[];
  for (var s in sp.getStringList('notes-id')){
    l.add(Note(time:s,title:sp.getString('$s-title'),notes:sp.getString('$s-note')));
  }
  listSink.add(l);
}
// List<Note> l=List.generate(5,(i)=>Note(time: DateTime.now().microsecondsSinceEpoch.toString(),notes:'Notes $i',title: 'Title $i'));

static final  Bloc _singlton=Bloc._create();


var _streamController=StreamController<String>();
var _todoListStreamController=StreamController<List<Note>>();

Stream<List<Note>> get listStream=>_todoListStreamController.stream;
Stream<String> get stream => _streamController.stream;

Sink<List<Note>> get listSink=>_todoListStreamController.sink;
Sink<String> get sink =>_streamController.sink;

Bloc._create();

factory Bloc(){return _singlton;} 

// void refresh(){
//   listSink.add(l);
//   print(l);
// }  

void dispose(){
  _todoListStreamController.close();
  _streamController.close();
  sink.close();
}

}