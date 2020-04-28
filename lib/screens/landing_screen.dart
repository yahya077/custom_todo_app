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
            TasksSlider(),
            Sh(20),
            CategoriesGrid(),
      ],
    );
  }
}
