
class AnalysisModel{

  int? GPA;
  List GRADES=[];
  List LABELS=[];

  AnalysisModel.fromJson(Map<String,dynamic> json){

    GPA=json['GPA'];

    json['GRADES'].forEach((element){

      GRADES.add(element);

    });

    json['LABELS'].forEach((element){

      GRADES.add(element);

    });

  }

}