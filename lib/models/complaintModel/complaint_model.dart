class ComplaintModel {
  String? title;
  String? content ;


  ComplaintModel ({
    required this.title ,
    required this.content ,
  });

  ComplaintModel.fromFire(Map <String , dynamic> fire){
    title = fire['title'];
    content = fire['content'];
  }

  Map <String , dynamic> toMap ()
  {
    return{
      'title' : title,
      'content' : content,

    };
  }

}