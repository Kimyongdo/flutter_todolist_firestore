import 'package:flutter/material.dart';
import 'package:todoapp_project_firestore/data/firestore_service.dart';
import 'package:todoapp_project_firestore/model/note.dart';


class AddNotePage extends StatefulWidget {

  final Note note;
  const AddNotePage({Key key, this.note}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  //form를 위해 만듦
  //TODO : 컨트롤러 공부하기
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  FocusNode _descriptionNode;


  //컨트롤러 세팅시 초기에 넣어놓기.
  @override
  void initState() {
    super.initState();
    _titleController=TextEditingController(
        text: widget.note != null ? widget.note.title : '');
    _descriptionController = TextEditingController(
        text: widget.note != null ? widget.note.description : '');
    _descriptionNode= FocusNode();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note !=null ? "수정하기" : '일정추가하기'
        ,style:  TextStyle(color: Colors.black),),
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset("images/dog_background.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            color: Colors.white70.withOpacity(1.0),
            colorBlendMode: BlendMode.colorBurn,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      //키보드 출력시 다음으로 이동할 수 있도록.
                      textInputAction: TextInputAction.next,
                      onEditingComplete: (){
                        //누르면 이쪽으로 포커스가 이동하도록
                        FocusScope.of(context).requestFocus(_descriptionNode);
                      },
                      controller: _titleController,
                      //유효성 검사.
                      validator: (value){
                        if(value==null || value.isEmpty) return "이건 꼭 써주세요!";
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        labelStyle:TextStyle(
                          fontSize: 18.0,
                        ),
                        labelText: "제목",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      focusNode: _descriptionNode,
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        labelText: "자세히",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    Center(
                      child: Container(
                        width: 200,
                        height: 60,
                        child: RaisedButton(
                          elevation:2,
                          shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(18.0),
                          ),
                          color: Colors.amberAccent[100],
                          textColor: Colors.black,
                          child: Text(widget.note!=null?  "수정하기" : "일정추가",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                          onPressed: () async{
                            if(_key.currentState.validate()){
                              try{
                                if(widget.note!=null){
                                  Note note = Note(
                                      title: _titleController.text,
                                      description: _descriptionController.text,
                                      id: widget.note.id
                                  );
                                  await FireStoreService().updateNote(note);
                                  Navigator.pop(context);
                                }else{
                                  Note note = Note(
                                    title: _titleController.text,
                                    description: _descriptionController.text,
                                  );
                                  await FireStoreService().addNote(note);
                                  Navigator.pop(context);
                                }

                              }catch(e){
                                print(e);
                              }
                            }

                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


