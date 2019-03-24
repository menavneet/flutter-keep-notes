import 'package:flutter/material.dart';
import 'base.dart';
import 'Note.dart';
import 'create-note.dart';
import 'mytheme.dart';
import 'show-note.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => BaseWidget.of(context).bloc.refresh(),
          )
        ],
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                     child: StreamBuilder<List<Note>>(
                    stream: BaseWidget.of(context).bloc.listStream,
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, i) => Dismissible(
                            background: Container(
                              decoration: BoxDecoration(color: Colors.red[200]),
                            ),
                            confirmDismiss: (direction) {
                              return showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Delete ?"),
                                      content: Text('Are you really want to delete'),
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
                            key: Key('list$i'),
                            child: ListTile(

                               leading:CircleAvatar(backgroundColor:Theme.of(context).buttonColor,child: Icon(Icons.edit), ),
                              title: Text(snapshot.data[i].title),
                              onTap: () => Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ShowNote(index: i);
                                  })),
                              subtitle: Text(DateTime.fromMicrosecondsSinceEpoch(
                                      int.parse(snapshot.data[i].time))
                                  .toString()),
                            )),
                      );
                    }),
              ),
              Container(
                color: Colors.black12,
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:8),
                child: Text('Swip Left / Right For remove notes'),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(
          Icons.add_comment,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateNote())),
      ),
    );
  }

  bool confirm(DismissDirection d) {
    return true;
  }

  @override
  void dispose() {
    BaseWidget.of(context).bloc.dispose();
    super.dispose();
  }
}
