import 'package:flutter/material.dart';
import 'package:jona/widgets/route.dart';
import 'package:jona/widgets/social_media_icons.dart';

import '../constanst.dart';
import 'menu_type.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
    required this.dWidth,
  });

  final double dWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: dWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DrawerHeader(
              child: Text(
                Companydata.companyname,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 10),
                  Icon(Icons.shopping_bag),
                  SizedBox(width: 20),
                  Text("Item:"),
                  SizedBox(width: 10),
                  Text("500.00"),
                ],
              ),
            ),
            //const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/ghana.png", height: 20, width: 20,),
                      const SizedBox(width: 8),
                      const Text("Ghana"),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8),
                        Text("Login")
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            ExpansionTile(
              leading: const Icon(Icons.menu, color: Colors.white54,),
              title: const Text("MENU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              collapsedIconColor: Colors.white54,
              childrenPadding: const EdgeInsets.only(left: 30),
              collapsedBackgroundColor: Colors.black54,
              backgroundColor: Colors.grey,
              children: [
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.dashboard);
                    },
                      child: const MenuType(isSelected: true, coffeeType: 'HOME')),
                ),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.mainShop, arguments: "id");
                    },
                      child: const MenuType(isSelected: false, coffeeType: 'SHOP')),
                ),
                const ListTile(
                  title: MenuType(isSelected: false, coffeeType: 'BLOG'),
                ),
                const ListTile(
                  title: MenuType(isSelected: false, coffeeType: 'CONTACT'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SocialMediaIcons(),
                ],
              ),
            ),
            // const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.email, size: 18,),
                  const SizedBox(width: 8,),
                  Text(Companydata.companyname),
                ],
              ),
            ),
            //const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_pin, size: 18,),
                  const SizedBox(width: 8),
                  Text(Companydata.address),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}