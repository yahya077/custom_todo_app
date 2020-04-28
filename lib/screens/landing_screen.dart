import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Widgets
import '../widgets/landing_bar.dart';
import '../widgets/heading_bar.dart';
import '../widgets/date_bar.dart';
import '../widgets/categories_slider.dart';

//Utils
import '../utils/sized_container.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
            CategoriesSlider(),
            Sh(20),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text("Categories",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 26),
                      child: Text("3 categories | 15 task", style: TextStyle(color: Colors.grey,fontSize: 10),),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1.9,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF38483),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.person, color: Colors.white,),
                              Sh(3),
                              Text("Personal", style: TextStyle(color: Colors.white),),
                              Sh(7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("8 task to do", style: TextStyle(color: Colors.white, fontSize: 10),),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff8BC9DF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.laptop, color: Colors.white,),
                              Sh(3),
                              Text("Work", style: TextStyle(color: Colors.white),),
                              Sh(7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("10 task to do", style: TextStyle(color: Colors.white, fontSize: 10),),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff7B77FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.shopping_cart, color: Colors.white,),
                              Sh(3),
                              Text("Shopping", style: TextStyle(color: Colors.white),),
                              Sh(7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("4 task to do", style: TextStyle(color: Colors.white, fontSize: 10),),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.add_box, color: Colors.black54,),
                              Sh(3),
                              Text("Add a category", style: TextStyle(color: Colors.black54),),
                              Sh(7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
      ],
    );
  }
}
