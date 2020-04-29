import 'package:customtodoapp/core/services/task_service.dart';
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


class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen() : super();
  final String header = "Categories";
  final String by = "1";
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  List<Task> _tasks;
  List<TaskCategories> _categories;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _title;
  String _headerProgress;
  String _selectedCategory;
  DateTime _dateTime = DateTime.now();
  List<DropdownMenuItem<int>> _dropColors;
  List<DropdownMenuItem<int>> _dropIcons;
  int _currentColor;
  int _currentIcon;

  List _colors =
  [ 0xff7b77FF,
    0xffffd257,
    0xff74fc72,
    0xffe685ed,
    0xffb56d74,
    0xffff9021,
    0xff9f77f7,];
  List _icons =
  [ 0xe31e,
    0xe865,
    0xe55b,
    0xe8cc,
    0xe0c9,
    0xe88a,];

  @override
  void initState() {
    super.initState();
    _categories = [];
    _headerProgress = widget.header;
    _scaffoldKey = GlobalKey();
    _title = TextEditingController();
    _getAllCategories();
    //Getting Colors
    _dropColors = _getColors();
    _currentColor = _dropColors[0].value;
    //Getting Icons
    _dropIcons = _getIcons();
    _currentIcon = _dropIcons[0].value;
  }

  List<DropdownMenuItem<int>> _getColors() {
    List<DropdownMenuItem<int>> items = new List();
    for (int color in _colors) {
      items.add(new DropdownMenuItem(
          value: color,
          child: new Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(color),
            ),
          )
      ));
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getIcons() {
    List<DropdownMenuItem<int>> items = new List();
    for (int icon in _icons) {
      items.add(new DropdownMenuItem(
          value: icon,
          child: new Container(
            height: 20,
            width: 50,
            alignment: Alignment.center,
            child: Icon(IconData(icon, fontFamily: "MaterialIcons"), color: Color(_currentColor),),
          )
      ));
    }
    return items;
  }

  _showProgress(String msg){
    setState(() {
      _headerProgress = msg;
    });
  }

  _clearValues(){
    _title.text = "";
  }

  _showSnackBar(context, msg){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg),));
  }

  _addCategory(){
    if(_title.text.isEmpty){
      _showSnackBar(context, "Empty Fields");
      return;
    }
    _showProgress("Adding Category...");
    TaskServices.addCategory(widget.by, _title.text, _currentIcon.toString(), _currentColor.toString()).then((result){
      if(result == "success"){
        _showSnackBar(context, "Add completed");
        _clearValues();
        _showProgress(widget.header);
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
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff7b77FF),
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
                              tag: "addCategory",
                              child: Icon(Icons.arrow_back_ios, color: Colors.white,))),
                      Icon(Icons.more_vert, color: Colors.white,)
                    ],
                  ),
                ),
                FadeAnimation(.2, Container(
                  height: 35,
                  child: Text(widget.header, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
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
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                        child: TextField(
                          controller: _title,
                          autofocus: false,
                          autocorrect: false,
                          maxLength: 24,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hasFloatingPlaceholder: false,
                            labelText: "Name your Category",
                          ),
                        ),
                      ),),
                      Sh(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Text("Color", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)),
                              ),
                              Container(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: _currentColor,
                                      items: _dropColors,
                                      onChanged: changedDropDownColor,
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Sw(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text("Icon",  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500))),
                              Container(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: _currentIcon,
                                      items: _dropIcons,
                                      onChanged: changedDropDownIcon,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      Sh(25),
                      FadeAnimation(.8, Container(
                        height: 35,
                        child: Text("Display Category Card", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),),
                      ),),
                      Sh(10),
                      Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 55),
                        decoration: BoxDecoration(
                          color: Color(_currentColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(IconData(_currentIcon, fontFamily: "MaterialIcons"), color: Colors.white,),
                              Sh(3),
                              Text(_title.text.toString(), style: TextStyle(color: Colors.white),),
                              Sh(7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("0 task to do", style: TextStyle(color: Colors.white, fontSize: 10),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Sh(15),
                      FadeAnimation(.5,Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Color(0xff7b77FF)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(onTap: _addCategory,child: Text("Save", style: TextStyle(color: Color(0xff7b77FF), fontSize: 18),)),
                      ),
                      ),
                    ],
                  ),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //when drop down changed then add on state
  void changedDropDownColor(int selectedColor) {
    setState(() {
      _currentColor = selectedColor;
    });
  }

  void changedDropDownIcon(int selectedIcon) {
    setState(() {
      _currentIcon = selectedIcon;
    });
  }
}
