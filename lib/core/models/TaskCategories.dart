class TaskCategories {

  String id;
  String catBy;
  String title;
  String color;
  String icon;
  bool isSelected = false;


  TaskCategories({this.id, this.catBy, this.title, this.color, this.icon});

  factory TaskCategories.fromJson(Map<String, dynamic>json){
    return TaskCategories(
      id: json['id'] as String,
      catBy: json['cat_by'] as String,
      title: json['title'] as String,
      color: json['color'] as String,
      icon: json['icon'] as String,
    );
  }


}