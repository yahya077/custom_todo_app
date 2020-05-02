import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//utils
import 'package:customtodoapp/utils/sized_container.dart';
//Animations
import 'package:customtodoapp/Animations/FadeAnimation.dart';
//model
import '../core/models/Task.dart';
import '../core/models/TaskCategories.dart';
//service
import '../core/services/task_service.dart';
//screen
import 'add_categories_screen.dart';

class AddNoteScreen extends StatefulWidget {
  Task task;
  AddNoteScreen({this.task});
  final String by = "1";
  final double ITEM_WIDTH = 200.0;
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  List<TaskCategories> _categories;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _title;
  TextEditingController _description;
  String _headerProgress;
  String _selectedCategory;
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _categories = [];
    _headerProgress = widget.task != null ? "Update Your Task" : "Add New Task";
    _selectedCategory = widget.task != null ? widget.task.category.id : "";
    _dateTime = widget.task != null ? DateTime.parse(widget.task.taskOn) : DateTime.now();
    _scaffoldKey = GlobalKey();
    _title = TextEditingController(text: widget.task != null ? widget.task.title : "");
    _description = TextEditingController(text: widget.task != null ? widget.task.description : "");
    _getAllCategories();
  }

  _showProgress(String msg){
    setState(() {
      _headerProgress = msg;
    });
  }

  _clearValues(){
    _title.text = "";
    _description.text = "";
    _selectedCategory = "";
    _dateTime = DateTime.now();
  }

  _showSnackBar(context, msg){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg),));
  }

  _addTask(){
    if(_title.text.isEmpty || _description.text.isEmpty || _selectedCategory.toString().isEmpty){
      print("Empty Fields");
      return;
    }

    _showProgress("Adding Task");
    TaskServices.addTask(widget.by, _selectedCategory, _title.text, _description.text, _dateTime.toString(), "0").then((result){
      if(result == "success"){
        _showSnackBar(context, "Add completed");
        _clearValues();
        _showProgress("Add New Task");
      }else {
        _showSnackBar(context, "Error");
      }
    });
  }

  _getAllCategories(){
    TaskServices.getCategories().then((categories){
      setState(() {
        _categories = categories;
      });
      for(var i=0; i < _categories.length; i++){
        if(widget.task != null || _selectedCategory != null){
          if(_categories[i].id == _selectedCategory){
            setState(() {
              _categories[i].isSelected = true;
            });
          }else if (widget.task != null){
            if(_categories[i].id == widget.task.category.id){
              setState(() {
                _categories[i].isSelected = true;
              });
            }
          }
        }
      }
      print("length ${categories.length}");
    });
  }

  _updateTask(){
    if(_title.text.isEmpty || _description.text.isEmpty || _selectedCategory.toString().isEmpty){
      print("Empty Fields");
      return;
    }
    _showProgress('Updating Task..');
    TaskServices.updateTask(widget.task.id,widget.by,_selectedCategory.toString(),_title.text,_description.text,_dateTime.toString(),"0").then((result){
      if('success' == result){
        _showSnackBar(context, "Update completed");
        _showProgress("Update Your Task");
        Navigator.pop(context, true);
      }else {
          print("404");
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: widget.task != null ? Color(int.parse(widget.task.category.color)) : Color(0xff8BC9DF),
      body:
      ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  height: 85,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                          onTap: (){Navigator.pop(context, false);},
                          child: Hero(
                              tag: "addTask",
                              child: Icon(Icons.arrow_back_ios, color: Colors.white,))),
                      Icon(Icons.more_vert, color: Colors.white,)
                    ],
                  ),
                ),
              FadeAnimation(.2, Container(
                height: 35,
                child: Text(_headerProgress, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              ),),
              FadeAnimation(.3, Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-145,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: Colors.white
                ),
                child: Column(
                  children: <Widget>[
                      FadeAnimation(.4, Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: _title,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hasFloatingPlaceholder: false,
                            labelText: "Name your task",
                          ),
                        ),
                      ),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(.5, Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: _description,
                            maxLines: 2,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hasFloatingPlaceholder: false,
                              labelText: "Content your task",
                            ),
                          ),
                        ),),
                      ],
                    ),
                    Sh(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(.6, Container(
                          padding: EdgeInsets.only(left: 18),
                          child: Text("Choose date", style: TextStyle(fontSize: 12, color: Colors.grey),),
                        ),),
                        Sh(10),
                        FadeAnimation(.7, Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: CupertinoDatePicker(
                            initialDateTime: _dateTime,
                            onDateTimeChanged: (dateTime){
                              setState(() {
                                _dateTime = dateTime;
                              });
                            },
                          ),
                        ),),
                      ],
                    ),
                    Sh(25),
                    FadeAnimation(.8, Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      child: ListView.builder(
                        itemCount: _categories.length,
                        itemBuilder: _getCategoriesGrid,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),),
                    Sh(50),
                    FadeAnimation(.9,Container(
                        width: widget.ITEM_WIDTH,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: widget.task != null ? Color(int.parse(widget.task.category.color)) : Color(0xff8BC9DF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(onTap: (){
                          widget.task != null ? _updateTask() : _addTask();
                        },child: Text(widget.task != null ? "Update" : "Save", style: TextStyle(color: Colors.white, fontSize: 18),)),
                      ),
                    ),
                  ],
                ),
              ),),
            ],
          ),
        ],
      ),
    );
  }

Widget _getCategoriesGrid(BuildContext context, int index){
  if (_categories[index].id == "1") {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCategoryScreen())).then((val){
          if(val != "0"){
            setState(() {
              _selectedCategory = val;
            });
            _showSnackBar(context, val);
            _getAllCategories();
          }else {
            Container();
          }
        });
      },
      child: Hero(
        tag: "addCategory",
        child: Container(
          width: 120,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Color(0xff191970)),
          ),
          child: Icon(Icons.add, color: Color(0xff191970),),
        ),
      ),
    );
  }else {
    return GestureDetector(
      onTap: () {
        if (_categories.any((item) => item.isSelected)) {
          setState(() {
            _categories[index].isSelected = false;
            print("ifde");
          });
        }else {
          setState(() {
            _categories[index].isSelected = true;
            _selectedCategory = _categories[index].id;
            print("elsede");
          });
        }
      },
      child: Container(
        width: 120,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: _categories[index].isSelected ? Color(0xff8BC9DF) : Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: _categories[index].isSelected ? Colors.white : Color(int.parse(_categories[index].color)),
        ),
        child: Text(_categories[index].title, style: TextStyle(color:_categories[index].isSelected ? Color(0xff8BC9DF):Colors.white),),
      ),
    );
  }
  }
}
