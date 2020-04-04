import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp_project_firestore/model/note.dart';



class FireStoreService{

  static final FireStoreService _fireStoreService =
  FireStoreService._internal();
  Firestore _db = Firestore.instance;

  FireStoreService._internal();

  //TODO: 팩토리 공부하기
  factory FireStoreService(){
    return _fireStoreService;
  }

  //notes 경로의 파이어스토어 정보를 얻어오고,
  Stream<List<Note>> getNotes() {
    return _db.collection('notes').snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => Note.fromMap(doc.data, doc.documentID), //ID와 정보를 가져온다.
      ).toList(),
    );
  }

  //내용은 여러개니까 class Note를 넣음
  Future<void> addNote(Note note){
    return _db.collection('notes').add(note.toMap());
  }

  //노트 내용 제거
  Future<void> deleteNote(String id){
    return _db.collection('notes').document(id).delete();
  }

  //노트 내용 업데이트 - id를 기준으로
  Future<void> updateNote(Note note) async{
    return  await _db.collection('notes').document(note.id).updateData(note.toMap());
  }



}