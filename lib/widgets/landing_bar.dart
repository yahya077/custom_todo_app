import 'package:flutter/material.dart';

class LandingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Icon(Icons.menu),
        )
      ],
    );
  }
}
