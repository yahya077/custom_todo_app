import 'dart:convert';
import 'package:customtodoapp/core/models/Date.dart';
import 'package:customtodoapp/core/models/Task.dart';
import 'package:customtodoapp/core/models/TaskCategories.dart';
import 'package:http/http.dart' as http;

class TaskServices {

  static const ROOT = 'http://192.168.1.33/taskmanager/api.php';
  static const _ADD_TASK_ACTION = 'ADD_TASK';
  static const _ADD_CATEGORY_ACTION = 'ADD_CATEGORY';
  static const _GET_CATEGORIES_ACTION = 'GET_ALL_CATEGORIES';
  static const _GET_TASKS_ACTION = 'GET_ALL_TASKS';
  static const _GET_DATE_ACTION = 'GET_ALL_DATE';
  static const _UPDATE_TASK_ACTION = 'UPDATE_TASK';
  static const _UPDATE_TASK_STATUS_ACTION = 'UPDATE_TASK_STATUS';

  static Future<String> addTask(String taskBy, String catId, String title, String description, String taskOn, String status) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = _ADD_TASK_ACTION;
      map['task_by'] = taskBy;
      map['cat_id'] = catId;
      map['title'] = title;
      map['description'] = description;
      map['task_on'] = taskOn;
      map['status'] = status;
      final response = await http.post(ROOT, body: map);
      //print('Add Task Response: ${response.body}');
      if(response.statusCode == 200){
        return response.body;
      }else {
        return response.statusCode.toString();
      }
    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> addCategory(String catBy, String title, String icon, String color) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = _ADD_CATEGORY_ACTION;
      map['cat_by'] = catBy;
      map['title'] = title;
      map['color'] = color;
      map['icon'] = icon;
      final response = await http.post(ROOT, body: map);
      //print('Add Category Response: ${response.body}');
      if(response.statusCode == 200){
        return response.body;
      }else {
        return response.statusCode.toString();
      }
    }catch(e){
      //print(e.toString());
      return e.toString();
    }
  }

  static Future<List<TaskCategories>> getCategories() async {
    try{

      var map = Map<String, dynamic>();
      map['action'] = _GET_CATEGORIES_ACTION;
      final response = await http.post(ROOT, body: map);
      //print('Get Categories Response: ${response.body}');
      if(response.statusCode == 200){
        List<TaskCategories> list = _parseResponse(response.body);
        return list;
      }else {
        return List<TaskCategories>();
      }
    }catch(e){
      return List<TaskCategories>();
    }
  }

  static List<TaskCategories> _parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TaskCategories>((json) => TaskCategories.fromJson(json)).toList();
  }

  static Future<List<Task>> getTasks(String x) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = _GET_TASKS_ACTION;
      map['term'] = x;
      final response = await http.post(ROOT, body: map);
      //print('Get Tasks Response: ${response.body}');
      if(response.statusCode == 200){
        if(response.body != "error"){
          Future<List<Task>> list = parseResponse(response.body);
          return list;
        }else {
          return List<Task>();
        }
      }else {
        return List<Task>();
      }
    }catch(e){
      return List<Task>();
    }
  }

  static Future<List<Task>> parseResponse(String responseBody) async {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Task>((json) => Task.fromJson(json)).toList();
  }

  static Future<String> updateTaskStatus(String id,String status) async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_TASK_STATUS_ACTION ;
      map['id'] = id;
      map['status'] = status;

      final response = await http.post(ROOT, body: map);
      //print('Update Task Response: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else {
        return response.body;
      }
    }catch(e){
      return e.toString();
    }
  }
  static Future<String> updateTask(String id,String taskBy,String catId, String title, String description, String taskOn,String status) async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_TASK_ACTION ;
      map['id'] = id;
      map['task_by'] = taskBy;
      map['cat_id'] = catId;
      map['title'] = title;
      map['description'] = description;
      map['task_on'] = taskOn;
      map['status'] = status;

      final response = await http.post(ROOT, body: map);
      //print('Update Task Response: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else {
        return response.body;
      }
    }catch(e){
      return e.toString();
    }
  }

  //Get All date from datebase
  static Future<List<Date>> getAllDateData() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = _GET_DATE_ACTION;
      final response = await http.post(ROOT, body: map);
      if(response.statusCode == 200){
        Future<List<Date>> list = _dateResponse(response.body);
        return list;
      }else {
        return List<Date>();
      }
    }catch(e){
      return List<Date>();
    }
  }

  static Future<List<Date>> _dateResponse(String responseBody) async {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Date>((json) => Date.fromJson(json)).toList();
  }


}