class TaskCategories {

  String id;
  String title;
  String src;
  bool isSelected = false;

  TaskCategories({this.id, this.title, this.src});

  factory TaskCategories.fromJson(Map<String, dynamic>json){
    return TaskCategories(
      id: json['id'] as String,
      title: json['title'] as String,
      src: json['title'] as String,
    );
  }


}