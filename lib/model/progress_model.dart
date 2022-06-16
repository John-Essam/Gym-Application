class ProgressModel{
  String id;
  String name;
  String weight;
  String goal;
  String start;
  String date;

  ProgressModel(
      {this.id, this.name, this.weight, this.goal, this.start, this.date});

  ProgressModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    goal = json['goal'];
    start =json['start'];
    date =json['date'];
  }

  Map<String , dynamic> toMap(){
    return {
      "id" : id,
      "name" : name,
      "weight" : weight,
      "goal" : goal,
      "start" : start,
      "date" : date,
    };
  }
}