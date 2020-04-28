import 'package:customtodoapp/utils/sized_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TasksSlider extends StatefulWidget {
  @override
  _TasksSliderState createState() => _TasksSliderState();
}

class _TasksSliderState extends State<TasksSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text("Today's Tasks",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26),
                child: Text("4 tasks to do and I completed", style: TextStyle(color: Colors.grey,fontSize: 10),),
              ),
            ],
          ),
          Sh(10),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 20),
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
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
                                  color: Color(0xffF38483),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                              margin: EdgeInsets.only(top: 8,left: 8),
                              alignment: Alignment.center,
                              child: Text("Personal", style: TextStyle(fontSize: 8,color: Colors.white),),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(top: 8,right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: const Color(0xffF38483)),
                                color: Color(0xffF38483),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Icon(Icons.done, color: Colors.white,size: 10,),
                            )
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 60,
                          margin: EdgeInsets.only(top: 5,left: 9),
                          child: Text("My UI Work day/42 : Design a To Do List",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, color: Colors.grey.shade400),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, right: 7),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.arrow_forward_ios, color: Color(0xffF38483),size: 15,),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                                  color: Color(0xff8BC9DF),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                              margin: EdgeInsets.only(top: 8,left: 8),
                              alignment: Alignment.center,
                              child: Text("Work", style: TextStyle(fontSize: 8,color: Colors.white),),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(top: 8,right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: const Color(0xff8BC9DF)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 60,
                          margin: EdgeInsets.only(top: 5,left: 9),
                          child: Text("My UI Work day/42 : Design a To Do List",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, right: 7),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.arrow_forward_ios, color: Color(0xff8BC9DF),size: 15,),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                                  color: Color(0xff7B77FF),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                              margin: EdgeInsets.only(top: 8,left: 8),
                              alignment: Alignment.center,
                              child: Text("Shopping", style: TextStyle(fontSize: 8,color: Colors.white),),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(top: 8,right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: const Color(0xff7B77FF)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 60,
                          margin: EdgeInsets.only(top: 5,left: 9),
                          child: Text("My UI Work day/42 : Design a To Do List",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, right: 7),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.arrow_forward_ios, color: Color(0xff7B77FF),size: 15,),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                                  color: Color(0xffF38483),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                              margin: EdgeInsets.only(top: 8,left: 8),
                              alignment: Alignment.center,
                              child: Text("Personal", style: TextStyle(fontSize: 8,color: Colors.white),),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(top: 8,right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: const Color(0xffF38483)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 60,
                          margin: EdgeInsets.only(top: 5,left: 9),
                          child: Text("My UI Work day/42 : Design a To Do List",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, right: 7),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.arrow_forward_ios, color: Color(0xffF38483),size: 15,),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                                  color: Color(0xffF38483),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                              margin: EdgeInsets.only(top: 8,left: 8),
                              alignment: Alignment.center,
                              child: Text("Personal", style: TextStyle(fontSize: 8,color: Colors.white),),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(top: 8,right: 8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: const Color(0xffF38483)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 60,
                          margin: EdgeInsets.only(top: 5,left: 9),
                          child: Text("My UI Work day/42 : Design a To Do List",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, right: 7),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.arrow_forward_ios, color: Color(0xffF38483),size: 15,),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
