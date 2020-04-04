
import 'package:flutter/material.dart';
import 'package:todoapp_project_firestore/data/firestore_service.dart';
import 'package:todoapp_project_firestore/model/note.dart';
import 'package:todoapp_project_firestore/widgets/list_single.dart';

class StreamListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreService().getNotes() , //파이어베이스 정보 가져오기
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot){
        if(snapshot.hasError || !snapshot.hasData) //없다면 스피너
          return CircularProgressIndicator();

        //정보가 있다면
        return ListView.builder(
          itemCount: snapshot.data.length,//이 화면에 보여질 개수
          itemBuilder: (BuildContext context, int index) {
            Note note = snapshot.data[index]; //데이터 덩어리(이 것을 기준으로)
            return StreamSingle(note: note);
          },
        );
      },
    );
  }
}

