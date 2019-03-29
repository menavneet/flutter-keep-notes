import 'package:flutter/material.dart';
import 'base.dart';
import 'note.dart';
import 'create-note.dart';
import 'mytheme.dart';
import 'note-tile.dart';

main() => runApp(BaseWidget(
        child: MaterialApp(
      theme: MyTheme.getTheme,
      home: MyApp(),
    )));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BaseWidget.of(context).bloc.refresh();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Keep Note'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text('Swip  Right for remove notes',style: TextStyle(
              color:Colors.black26
            ),),
          ),
          Expanded(
            child: StreamBuilder<List<Note>>(
                stream: BaseWidget.of(context).bloc.listStream,
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data.length == 0)
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Add Your Notes Here',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, i) => NoteTile(
                          note: snapshot.data[i],
                        ),
                  );
                }),
          ),
          // Divider(),

        ],
      )
      ),
      bottomNavigationBar: BottomAppBar(
        child:          Container(
            color:Colors.yellow[100],
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('Create Note'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CreateNote())),
            ),
          ), 
      ),
    );
  }

  @override
  void dispose() {
    BaseWidget.of(context).bloc.dispose();
    super.dispose();
  }
}
