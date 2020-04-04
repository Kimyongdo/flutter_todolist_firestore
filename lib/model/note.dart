class Note{
   final String title;
   final String description;
   bool isChecked = false;
   final String id;

   Note({this.title, this.description, this.isChecked=false, this.id});

   // : 이거 줄인말인데 뭘까 - ?
   Note.fromMap(Map<String,dynamic> data, String id):
   title=data["title"],
   description = data["description"],
   isChecked = data["isChecked"],
   id=id;

    Map<String,dynamic> toMap(){
      return {
        "title" : title,
        "description" : description,
        "isChecked" : isChecked,
      };
    }



}