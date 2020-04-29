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
  AddNoteScreen() : super();
  final String header = "Add New Task";
  final String by = "1";
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  List<Task> _tasks;
  List<TaskCategories> _categories;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _title;
  TextEditingController _description;
  String _headerProgress;
  String _selectedCategory;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tasks = [];
    _categories = [];
    _headerProgress = widget.header;
    _scaffoldKey = GlobalKey();
    _title = TextEditingController();
    _description = TextEditingController();
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
  }

  _showSnackBar(context, msg){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg),));
  }

  _addTask(){
    if(_title.text.isEmpty || _description.text.isEmpty || _selectedCategory.toString().isEmpty || _categories.any((item) => item.isSelected = false)){
      print("Empty Fields");
      return;
    }
    _showProgress("Adding Task");
    TaskServices.addTask(widget.by, _selectedCategory, _title.text, _description.text, _dateTime.toString(), "0").then((result){
      if(result == "success"){
        _showSnackBar(context, "Add completed");
        _clearValues();
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
      print("length ${categories.length}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff8BC9DF),
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
                          onTap: (){Navigator.pop(context);},
                          child: Hero(
                              tag: "addTask",
                              child: Icon(Icons.arrow_back_ios, color: Colors.white,))),
                      Icon(Icons.more_vert, color: Colors.white,)
                    ],
                  ),
                ),
              FadeAnimation(.2, Container(
                height: 35,
                child: Text("Add New Task", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
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
                        child: TextField(
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
                          child: TextField(
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
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff8BC9DF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(onTap: _addTask,child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 18),)),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCategoryScreen()));
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
          });
        }else {
          setState(() {
            _categories[index].isSelected = true;
            _selectedCategory = _categories[index].id;
          });
        }
      },
      child: Container(
        width: 120,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: _categories[index].isSelected == true ? Color(0xff8BC9DF) : Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: _categories[index].isSelected == true ? Colors.white : Color(int.parse(_categories[index].color)),
        ),
        child: Text(_categories[index].title, style: TextStyle(color: _categories[index].isSelected == true ? Color(0xff8BC9DF):Colors.white),),
      ),
    );
  }
  }
}
