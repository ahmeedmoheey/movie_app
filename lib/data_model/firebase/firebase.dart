class MovieDM{
  String id;
  String title;
  bool isDone;
   MovieDM ({required this.id,required this.title ,required this.isDone});
   Map<String , dynamic> toFireStore ()=>{
     'id' : id,
     'title' : title,
     'isDone' : isDone,

   };

   MovieDM.fromFireStore (Map<String ,dynamic> data) : this (
     id: data['id'],
     title: data['title'],
     isDone: data['isDone']
   );

}