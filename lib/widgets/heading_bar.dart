import 'package:customtodoapp/screens/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HeadingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Monday 20 April",style: TextStyle(fontSize: 12, color: Colors.grey),),
              Text("Good Morning", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black87),),
              Text("William", style: TextStyle(color: Color(0xffe8c188),fontWeight: FontWeight.w500, fontSize: 24),)
            ],
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNoteScreen()));
          },
          child: Hero(
            tag: "addTask",
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xff8BC9DF),
                ),
                child: Icon(Icons.add, color: Colors.white,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
