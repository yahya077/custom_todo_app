import 'package:customtodoapp/utils/sized_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget DateBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 24),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("M", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("T", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("W", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("T", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("F", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("S", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("S", style: TextStyle(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.bold),)),
          ],
        ),
        Sh(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 15,
                height: 15,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
            Container(
                width: 15,
                height: 15,
                alignment: Alignment.center,
                child: Text("15", style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.bold),)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
            ),
            Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
            ),
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent
              ),
            ),
            Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
            ),
            Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
            ),
            Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
            ),
            Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
            ),
          ],
        ),
        Sh(2),
      ],
    ),
  );
}