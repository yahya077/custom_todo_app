import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Utils
import 'package:customtodoapp/utils/sized_container.dart';
//Screens
import 'package:customtodoapp/screens/add_categories_screen.dart';
//Models
import 'package:customtodoapp/core/models/TaskCategories.dart';

Widget CategoriesGrid(List<TaskCategories> _categories, BuildContext context){
  return
    _categories.length > 0 ?
    Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: GridView.custom(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.9,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          childrenDelegate: SliverChildListDelegate(
            List.generate(4, (index){
              return _categories[index].id == "1" ? InkWell(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCategoryScreen()));
               },
               child: Container(
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
             )
                 : Container(
              decoration: BoxDecoration(
              color: Color(int.parse(_categories[index].color)),
              borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Icon(IconData(int.parse(_categories[index].icon), fontFamily: "MaterialIcons"), color: Colors.white,),
              Sh(3),
              Text(_categories[index].title, style: TextStyle(color: Colors.white),),
              Sh(7),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(_categories[index].taskToDo+" task to do", style: TextStyle(color: Colors.white, fontSize: 10),),
              Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white,),
              ),
              ],
              )
              ],
              ),
              ),
              );
            })
          ),
        ),
      ),
    ],
  ):
  Center(child: CircularProgressIndicator(),);
}