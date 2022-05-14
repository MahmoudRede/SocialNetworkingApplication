class ComplaintModel {
  String? title;
  String? content ;
  String? time;


  ComplaintModel ({
    required this.title ,
    required this.content ,
    required this.time ,

  });

  ComplaintModel.fromFire(Map <String , dynamic> fire){
    title = fire['title'];
    content = fire['content'];
    time = fire['time'];

  }

  Map <String , dynamic> toMap ()
  {
    return{
      'title' : title,
      'content' : content,
      'time' : time,

    };
  }

}