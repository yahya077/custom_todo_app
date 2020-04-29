import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Widgets
import '../widgets/landing_bar.dart';
import '../widgets/heading_bar.dart';
import '../widgets/date_bar.dart';
import '../widgets/tasks_slider.dart';
import '../widgets/categories_grid.dart';

//Utils
import '../utils/sized_container.dart';
//Models
import '../core/models/TaskCategories.dart';
import '../core/models/Task.dart';
//Service
import '../core/services/task_service.dart';


class LandingScreen extends StatefulWidget {
  LandingScreen() : super();
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<TaskCategories> _categories;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _categories = [];
    _getAllCategories();
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
                DateBar(),
              ],
            ),
          ),
          Sh(20),
          TasksSlider(),
          Sh(20),
          CategoriesGrid(_categories, context),
        ],
      ),
    );
  }
}

