import 'package:customtodoapp/core/models/TaskCategories.dart';

class Task {

  String id;
  String taskBy;
  String title;
  String description;
  String taskOn;
  String status;
  TaskCategories category;

  Task({this.id, this.taskBy, this.category, this.title, this.description, this.taskOn,this.status});

  factory Task.fromJson(Map<String, dynamic>json){
    return Task(
      id: json['id'] as String,
      taskBy: json['task_by'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      taskOn: json['task_on'] as String,
      status: json['status'] as String,
      category: TaskCategories.fromJson(json["category"]),
    );
  }





}