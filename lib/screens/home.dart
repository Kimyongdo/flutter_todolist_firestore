import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todoapp_project_firestore/screens/add_note.dart';
import 'package:todoapp_project_firestore/widgets/stream_list_view.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFFFAE0B6),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAE0B6),
        title: Center(child: Text('오늘은 뭐 할까?', style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black
        ),)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>AddNotePage()
              ));
            },
          )
        ],
      ),
      //streamBuidler로 body영역을 만듦
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
             child: Image.asset('images/puppy.gif'),
            ),
            Expanded(
              flex:2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: StreamListView()
              ),
            ),
          ],
        ),
      )
    );
  }

}


