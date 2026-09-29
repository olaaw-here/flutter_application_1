import 'package:flutter/material.dart';
import 'add_note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyNotes(),
    );
  }
}


class MyNotes extends StatefulWidget {
  const new({super.key});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
   List notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
      title: Text("My Notes"),
      actions:[
        IconButton(onPressed: (){}, icon: Icon(Icons.logout))
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(),)
      );

      if(result != null){
        setState((){
          notes.add(result);
        });
      }
      }, 
      
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount : notes.length,
        itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Icon(Icons.note),
              title: Text(notes[index]['judul']),
              subtitle: Text(notes[index]['deskripsi']),
              trailing: Icon(Icons.navigate_next),
            ),
          ), ),
    );
  }
}

  