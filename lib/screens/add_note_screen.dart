import 'package:customtodoapp/Animations/FadeAnimation.dart';
import 'package:customtodoapp/utils/sized_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 120,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Color(0xff191970)),
                            ),
                            child: Icon(Icons.add, color: Color(0xff191970),),
                          ),
                          Container(
                            width: 120,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff7B77FF),
                            ),
                            child: Text("Shopping", style: TextStyle(color: Colors.white),),
                          ),
                          Container(
                            width: 120,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff8BC9DF),
                            ),
                            child: Text("Work", style: TextStyle(color: Colors.white),),
                          ),
                          Container(
                            width: 120,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffF38483),
                            ),
                            child: Text("Personal", style: TextStyle(color: Colors.white),),
                          ),
                        ],
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
                      child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),),
                  ],
                ),
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
