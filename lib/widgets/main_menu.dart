import 'package:flutter/material.dart';
import 'package:jona/widgets/route.dart';

import 'menu_type.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.dashboard);
          },
          child: const MenuType(
              isSelected: true,
              coffeeType: "HOME"
          ),
        ),
        SizedBox(width: 40),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.mainShop);
          },
          child: const MenuType(
              isSelected: false,
              coffeeType: "SHOP"
          ),
        ),
        const SizedBox(width: 30),
        const MenuType(
            isSelected: false,
            coffeeType: "PAGES"
        ),
        const SizedBox(width: 30),
        const MenuType(
            isSelected: false,
            coffeeType: "BLOG"
        ),
        const SizedBox(width: 30),
        const MenuType(
            isSelected: false,
            coffeeType: "CONTACT"
        ),
      ],
    );
  }
}