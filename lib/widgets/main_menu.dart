import 'package:flutter/material.dart';
import 'package:jona/widgets/route.dart';

import 'menu_type.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuTheme(
      data: PopupMenuThemeData(
        color: Colors.lightBlue[50],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.dashboard);
            },
            child: const MenuType(
              isSelected: true,
              coffeeType: "HOME",
            ),
          ),
          const SizedBox(width: 40),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.mainShop);
            },
            child: const MenuType(
              isSelected: false,
              coffeeType: "SHOP",
            ),
          ),
          const SizedBox(width: 30),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle submenu item click
              if (value == 'aboutUs') {
                Navigator.pushNamed(context, Routes.about);
              } else if (value == 'customerDirection') {
                Navigator.pushNamed(context, Routes.customerDirection);
                // Navigate to Customer Direction page
              } else if (value == 'ourTeam') {
                Navigator.pushNamed(context, Routes.ourTeam);
                // Navigate to Our Team page
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'aboutUs',
                child: Text('ABOUT HERITAGE BASKET'),
              ),
              const PopupMenuItem<String>(
                value: 'customerDirection',
                child: Text('CUSTOMER DIRECTION'),
              ),
              const PopupMenuItem<String>(
                value: 'ourTeam',
                child: Text('OUR TEAM'),
              ),
            ],
            child: const MenuType(
              isSelected: false,
              coffeeType: "ABOUT US",
            ),
          ),
          const SizedBox(width: 30),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.wholesale);
            },
            child: const MenuType(
              isSelected: false,
              coffeeType: "WHOLESALE",
            ),
          ),
          const SizedBox(width: 30),
          const MenuType(
            isSelected: false,
            coffeeType: "BLOG",
          ),
          const SizedBox(width: 30),
          const MenuType(
            isSelected: false,
            coffeeType: "CONTACT",
          ),
        ],
      ),
    );
  }
}
