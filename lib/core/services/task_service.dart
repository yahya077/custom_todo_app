import 'dart:convert';
import 'package:customtodoapp/core/models/TaskCategories.dart';
import 'package:http/http.dart' as http;

class TaskServices {

  static const ROOT = 'http://192.168.1.33/taskmanager/api.php';
  static const _ADD_TASK_ACTION = 'ADD_TASK';
  static const _GET_CATEGORIES_ACTION = 'GET_ALL_CATEGORIES';

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
      print('Add Task Response: ${response.body}');
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

  static Future<List<TaskCategories>> getCategories() async {
    try{

      var map = Map<String, dynamic>();
      map['action'] = _GET_CATEGORIES_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Get Employee Response: ${response.body}');
      if(response.statusCode == 200){
        List<TaskCategories> list = parseResponse(response.body);
        return list;
      }else {
        return List<TaskCategories>();
      }
    }catch(e){
      return List<TaskCategories>();
    }
  }

  static List<TaskCategories> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TaskCategories>((json) => TaskCategories.fromJson(json)).toList();
  }

}