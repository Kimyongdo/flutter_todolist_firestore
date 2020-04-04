import 'package:flutter/material.dart';
import 'package:todoapp_project_firestore/model/note.dart';

class NoteDetailsPage extends StatelessWidget {

  final Note note;
  const NoteDetailsPage({Key key, @required this.note}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('자세한 일정',style:  TextStyle(color: Colors.black)),
        backgroundColor: Colors.amberAccent,

      ),
      body: Stack(
        children: <Widget>[
          Image.asset("images/dog_background.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
            color: Colors.white70.withOpacity(1.0),
            colorBlendMode: BlendMode.colorBurn,
          ),
          SingleChildScrollView(
            child: Container(

              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Container(
                      width: sizeWidth*0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("제목", style: TextStyle(color: Color(0xFF700e01), fontWeight: FontWeight.bold, fontSize: 20.0),),
                          SizedBox(height: 10.0,),
                          Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(20.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border: Border.all(color: Color(0xFFff8503)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Text(note.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: sizeWidth*0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("자세히", style: TextStyle(color: Color(0xFF700e01), fontWeight: FontWeight.bold, fontSize: 20.0),),
                          SizedBox(height: 10.0,),
                          Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(20.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border: Border.all(color: Color(0xFFff8503)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Text(note.description,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)))
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
