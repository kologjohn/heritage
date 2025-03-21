import 'package:flutter/material.dart';

import '../components/global.dart';

class MenuType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  const MenuType({super.key, required this.isSelected, required this.coffeeType});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: Text(
        coffeeType,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: isSelected ? Global.mainColor: Colors.black,
        ),
      ),
    );
  }
}
