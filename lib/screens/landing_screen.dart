import 'package:customtodoapp/screens/add_note_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


//Widgets
import '../widgets/landing_bar.dart';
import '../widgets/heading_bar.dart';
import '../widgets/categories_grid.dart';

//Utils
import '../utils/sized_container.dart';
//Models
import '../core/models/TaskCategories.dart';
import '../core/models/Task.dart';
import '../core/models/Date.dart';
//Service
import '../core/services/task_service.dart';


class LandingScreen extends StatefulWidget {
  LandingScreen() : super();
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Task> _tasks;
  List<Date> _dateData;
  Iterable<Task> _categoryTaskCount;
  Iterable<Task> _unCompletedTask;
  List<TaskCategories> _categories;
  GlobalKey<ScaffoldState> _scaffoldKey;
  ItemScrollController _scrollController = ItemScrollController();
  DateTime _dateTime;
  List<String> _splittedDate;
  String _initialScrollIndex;
  String _headerDate;
  String _todayHeaderDay;
  String _todayHeaderMonth;


  @override
  void initState() {
    super.initState();
    _initialScrollIndex = "0";
    _headerDate = "Today's";
    _todayHeaderDay = "0";
    _todayHeaderMonth = "0";
    _dateTime = DateTime.now();
    _splittedDate = _dateTime.toString().split(" ");
    _categories = [];
    _tasks = [];
    _dateData = [];
    _categoryTaskCount = [];
    _unCompletedTask = [];
    _getAllCategories();
    _getTodayTasks(_splittedDate[0]);
    _getAllDateData();
  }

  _getAllCategories(){
    TaskServices.getCategories().then((categories) async{
        await TaskServices.getTasks("tasks.status = 0").then((tasks){
          for(var i =0; i < categories.length; i++) {
            _categoryTaskCount = tasks.where((task) => task.category.title == categories[i].title);
            categories[i].taskToDo = _categoryTaskCount.length.toString();
          }
        });
      setState((){
        _categories = categories;
      });
    });
  }

  _getAllDateData(){
    var splittedDate = _dateTime.toString().split(" ");
    splittedDate = splittedDate[0].split("-");
    TaskServices.getAllDateData().then((date){
      if(_initialScrollIndex == "0"){
        for(var i = 0; i < date.length; i++){
          if(date.toList()[i].month == splittedDate[1] && date.toList()[i].day == splittedDate[2]){
            date.toList()[i].isSelected = true;
            setState(() {
              _todayHeaderDay = date[i].day;
              _todayHeaderMonth = date[i].month;
              _initialScrollIndex = i.toString();
            });
          }
        }
      }
      setState((){
        _dateData = date;
      });
    });
  }
//
//  _getCategoryTaskCount(String title){
//    TaskServices.getTasks("tasks.status = 0").then((tasks){
//        return tasks.where((task) => task.category.title == title);
//    });
//  }

  _getTodayTasks(String x) async{
    await TaskServices.getTasks("tasks.task_on like '"+x+"%'").then((tasks){
      setState(() {
        _tasks = tasks;
        _unCompletedTask = tasks.where((task) => task.status == "0");
      });
    });
  }

  _completeTask(String selectedId,String value){
    print(selectedId+"****"+value);
    TaskServices.updateTaskStatus(selectedId,value).then((result){
      if('success' == result){

      }else {
        print("ERRR ROR: ${result}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          Material(
            elevation: 4,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                LandingBar(),
                Sh(10),
                HeadingBar(),
                Sh(10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  child:
                  _dateData.length > 0 ?
                  ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    initialScrollIndex: int.parse(_initialScrollIndex)-2,
                    scrollDirection: Axis.horizontal,
                    itemCount: _dateData.length,
                    itemBuilder: (context,index){
                      return
                        Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: InkWell(
                          onTap: (){
                            if(_initialScrollIndex != index.toString()){
                              for(var i = 0; i < _dateData.length; i++){
                                if(index != i){
                                  _dateData[i].isSelected = false;
                                }
                              }
                              setState(() {
                                if(_todayHeaderDay == _dateData[index].day && _todayHeaderMonth == _dateData[index].month){
                                  _headerDate = "Today's";
                                }else {
                                  var _firtDateIndexName = _dateData[index].month != "05" ? "April" : "March";
                                  _headerDate = _dateData[index].day+" "+_firtDateIndexName;
                                }
                                _dateData[index].isSelected = true;
                                _initialScrollIndex = index.toString();
                                _getTodayTasks(_dateData[index].year+"-"+_dateData[index].month+"-"+_dateData[index].day);
                              });
                            }
                          },
                          child: Container(
                            width: 50,
                            padding: EdgeInsets.only(left: 17),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        width: 15,
                                        height: 15,
                                        alignment: Alignment.center,
                                        child: Text(_dateData[index].dayName, style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
                                  ],
                                ),
                                Sh(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        width: 25,
                                        height: 15,
                                        child: Text(_dateData[index].day, style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 10,
                                      height: 10,
                                      margin: EdgeInsets.only(top: 20),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: _dateData[index].isSelected ? Colors.redAccent : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ): Center(child: CircularProgressIndicator(),),
                ),
              ],
            ),
          ),
          Sh(20),
          Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(_headerDate+" Tasks",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: Text(
                    "${_tasks.length} tasks to do and I completed", style: TextStyle(color: Colors.grey,fontSize: 10),),
                ),
              ],
            ),
            Sh(10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20),
              height: 120,
              child:
              _tasks != null ?
              ListView.custom(
                  scrollDirection: Axis.horizontal,
                  childrenDelegate: SliverChildListDelegate(
                      List.generate(_tasks.length, (index){
                        return
                          _tasks[index] != null ?
                          InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddNoteScreen(task: _tasks[index]))).then((val) =>val?_getTodayTasks(_splittedDate[0]):null);
                          },
                          child: Card(
                            elevation: 2,
                            child: Container(
                              height: 100,
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            color: _tasks[index].category.color != null ? Color(int.parse(_tasks[index].category.color)) : Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                                        margin: EdgeInsets.only(top: 8,left: 8),
                                        alignment: Alignment.center,
                                        child: _tasks[index].category.title != null ? Text(_tasks[index].category.title, style: TextStyle(fontSize: 8,color: Colors.white),): Text("Loading..."),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          if(_tasks[index].status == "0"){
                                            _completeTask(_tasks[index].id, "1");
                                            setState(() {
                                              _getAllCategories();
                                              _getTodayTasks(_splittedDate[0]);
                                            });
                                          }else{
                                            _completeTask(_tasks[index].id, "0");
                                            setState(() {
                                              _getAllCategories();
                                              _getTodayTasks(_splittedDate[0]);
                                            });
                                          }
                                        },
                                        child:_tasks[index].category.color != null ?
                                        Container(
                                          height: 12,
                                          width: 12,
                                          margin: EdgeInsets.only(top: 8,right: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1.0, color: Color(int.parse(_tasks[index].category.color))),
                                            borderRadius: BorderRadius.circular(25),
                                            color: _tasks[index].status == "1" ? Color(int.parse(_tasks[index].category.color)): Colors.white,
                                          ),
                                          child: _tasks[index].status == "1" ? Icon(Icons.done, color: Colors.white,size: 10,) : Container() ,
                                        ): Center(child: CircularProgressIndicator(),),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 90,
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5,left: 9),
                                    child: Text(_tasks[index].title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, color: _tasks[index].status == "1" ? Colors.grey.shade400 : Colors.black54),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4, right: 7),
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.arrow_forward_ios, color: Color(int.parse(_tasks[index].category.color)),size: 15,),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ): Center(child: CircularProgressIndicator(),);
                      })
                  )
              ): Center(child: CircularProgressIndicator(),),
            ),
          ],
        ),
      ),
          Sh(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text("Categories",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26),
                child: Text("${_categories.length} categories | ${_unCompletedTask.length} task to do", style: TextStyle(color: Colors.grey,fontSize: 10),),
              ),
            ],
          ),
          Sh(5),
          CategoriesGrid(_categories, context),
        ],
      ),
    );
  }
}

