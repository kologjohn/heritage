import 'package:flutter/material.dart';
import 'package:jona/widgets/route.dart';

class MenuType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  const MenuType({super.key, required this.isSelected, required this.coffeeType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (coffeeType=="SHOP")
          {
            Navigator.pushNamed(context, Routes.mainShop);
          }
      },
      child: Container(
        color: Colors.white30,
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: isSelected ? Colors.orange: Colors.black,
          ),
        ),
      ),
    );
  }
}
