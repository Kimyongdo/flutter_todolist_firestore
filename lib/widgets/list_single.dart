import 'package:flutter/material.dart';
import 'package:todoapp_project_firestore/data/firestore_service.dart';
import 'package:todoapp_project_firestore/model/note.dart';
import 'package:todoapp_project_firestore/screens/add_note.dart';
import 'package:todoapp_project_firestore/screens/note_details.dart';

class StreamSingle extends StatefulWidget {

  Note note;
  StreamSingle({this.note});

  @override
  _StreamSingleState createState() => _StreamSingleState();
}

class _StreamSingleState extends State<StreamSingle> {

//  bool checking=false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.note.isChecked ? Icon(Icons.pets, color: Color(0xFF8f4500))
          :
      Icon(Icons.pets),
      onLongPress: ()=>_deleteNote(context, widget.note.id),
      title: Text(widget.note.title,
        //true, false기준으로 삼항연산자 ox니까
        style: widget.note.isChecked ?
        TextStyle(fontSize: 20.0, color: Colors.grey, decoration: TextDecoration.lineThrough) :
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)
        ),
      subtitle: Text(widget.note.description,
          style: widget.note.isChecked ?
          TextStyle(fontSize: 15.0, color: Colors.grey, decoration: TextDecoration.lineThrough) :
          TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,)
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            activeColor: Color(0xFFfeb204),
            value: widget.note.isChecked,
            onChanged:(bool value){
              setState(() {
                widget.note.isChecked=value;
              });
              //update
              Note note = Note(
                  title: widget.note.title,
                  description: widget.note.description,
                  isChecked: value,
                  id: widget.note.id
              );
               FireStoreService().updateNote(note);
            },
          ),
          IconButton(
              color: Color(0xFFff8503),
              icon: Icon(Icons.build),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (_)=>AddNotePage(note:widget.note),
              ))
          ),
        ],
      ),
      //클릭했을떄 이동하도록
      onTap: ()=>Navigator.push(context, MaterialPageRoute(
        //TODO : (_)에 대해서 알아보기
        builder: (_)=>NoteDetailsPage(note:widget.note,),
      )),
    );
  }
}


void _deleteNote(BuildContext context, String id) async {
  if(await _showConfirmationDialog(context)){ //다이얼로그에서 값을 전달함.
    try{
      await FireStoreService().deleteNote(id);
    }catch(e){
      print(e);
    }
  }
}


Future<bool> _showConfirmationDialog(BuildContext context) async{
  return showDialog(
      context: context,
      barrierDismissible: true, //다이얼로그 바깥 클릭하면 자동 pop
      builder: (context)=> Container(
        width: 30.0,
        height: 100.0,
        child: AlertDialog(
          content: Text("끝났어요?", style: TextStyle(
            fontSize: 20.0
          ),),
          actions: <Widget>[
            FlatButton(
              color: Color(0xFFff8503),
              child: Text("네", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context,true);//true값을 전달.
              },
            ),
            FlatButton(
              color: Colors.black,
              child: Text("아니오"),
              onPressed: (){
                Navigator.pop(context,false); //false값을 전달.
              },
            ),
          ],
        ),
      )
  );
}



