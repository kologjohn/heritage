import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jona/components/global.dart';
import 'package:jona/controller/controller.dart';
import 'package:provider/provider.dart';
import '../controller/dbfields.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/social_media_icons.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
   var querysnapshot=Dbfields.db.collection("items").orderBy(ItemReg.category).snapshots();

  String shoenum="";
  List<bool> active=[];
  final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final routeparam = ModalRoute.of(context)!.settings.arguments;
    String dfg="";
    if (routeparam != null && routeparam is Map<String, dynamic>) {
      final Map<String, dynamic> args =routeparam as Map<String, dynamic>;
      //querysnapshot=Dbfields.db.collection("items").orderBy(ItemReg.category).startAt(['value']).snapshots();
      //print(args['cate']);
      querysnapshot=Dbfields.db.collection("items").where(ItemReg.category, isEqualTo:args['cate'] ).snapshots();

      // final  datam= ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        dfg="yes";
      }
    else
      {
        dfg="No";
      }
    return Consumer<Ecom>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            //toolbarHeight: 100,
            title: Container(
              width: double.infinity,
              height: 50,
              color: Colors.lightGreen[50],
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, Routes.dashboard);
                            },
                            child: const MenuType(
                              isSelected: true,
                              coffeeType: "HOME",
                            ),
                          ),
                          const SizedBox(width: 40),
                          const MenuType(
                              isSelected: false,
                              coffeeType: "SHOP"
                          ),
                          const SizedBox(width: 40),
                          const MenuType(
                              isSelected: false,
                              coffeeType: "ABOUT US"
                          ),
                          const SizedBox(width: 40),
                          const MenuType(
                              isSelected: false,
                              coffeeType: "BLOG"
                          ),
                          const SizedBox(width: 40),
                          const MenuType(
                              isSelected: false,
                              coffeeType: "CONTACT"
                          ),
                        ],
                      ),
                      const SizedBox(width: 120),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Column(
                              children: [
                                TextField(
                                  controller: searchController,
                                  onChanged: (e){
                                    setState(() {
                                      shoenum=Ecom().capitalizeSentence(searchController.text.trim().toUpperCase());
                                      querysnapshot=Dbfields.db.collection("items").orderBy(ItemReg.item).startAt([shoenum]).snapshots();
                                      // print(shoenum);
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'What do you need?',
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                                    fillColor: Colors.white54,
                                    filled: true
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            color: Global.mainColor,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, Routes.singleProduct);
                              },
                              child: const Icon(Icons.favorite)
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                              onTap: ()async{
                                await value.cartidmethod();
                                final st=await value.alreadypaid(context);
                                Navigator.pushNamed(context, Routes.cart);
                              },
                              child: const Icon(Icons.shopping_cart)
                          ),
                          const SizedBox(width: 8),
                          Text("Total: USD ${value.mycarttotal}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.lightGreen[50],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 130.0, right: 130, top: 10),
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                    height: 1200,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            height: 50,
                                            color: Global.mainColor,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 18.0, right: 18),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.menu, color: Colors.white,),
                                                        Text(
                                                          "ALL CATEGORIES",
                                                          style: TextStyle(
                                                              color: Colors.white
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          height: 700,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                                            child: StreamBuilder<QuerySnapshot>(
                                              stream: Dbfields.db.collection("category").snapshots(),
                                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                                                if (!snapshot.hasData)
                                                {
                                                  return Text("No data");
                                                }

                                                return ListView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: snapshot.data!.docs.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    active.add(false);
                                                    String cate=snapshot.data!.docs[index]['name'];
                                                    return Container(child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                          onTap: (){
                                                            setState(() {
                                                              shoenum=Ecom().capitalizeSentence(cate);
                                                              querysnapshot=Dbfields.db.collection("items").where(ItemReg.category,isEqualTo: cate).snapshots();
                                                              if(active[index])
                                                              {
                                                                active.add(false);
                                                              } else{
                                                                active[index]=true;
                                                              }

                                                            });
                                                          },
                                                          child: MenuType(
                                                              isSelected: active[index],
                                                              coffeeType: cate
                                                          ),
                                                        ),
                                                        Divider(thickness: 1,color: Colors.grey[200],),
                                                        const SizedBox(height: 10),
                                                      ],
                                                    ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  )
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        //color: Colors.lightGreen[50],
                                        height: 50,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Sort by",
                                                style: TextStyle(
                                                    fontSize: 15
                                                ),
                                              ),
                                              SizedBox(width: 60),
                                              Text(
                                                "Default",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15
                                                ),
                                              ),
                                              Icon(Icons.keyboard_arrow_down)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          featuredGridview(shoenum: shoenum, widgth: 300, height: 200, name: 16, price: 16, favHeight: 30, favWidth: 100, favSize: 25, cartHeight: 30, cartWidth: 100, cartSize: 25, querySnapshot: querysnapshot,)
                                        ],
                                      )
                                    ],
                                  )
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 400,
                  color: Colors.lightGreen[50],
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 130.0, right: 130, top: 50),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  //color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(value.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                      const SizedBox(height: 20),
                                      Text("Address: ${value.companyaddress}"),
                                      const SizedBox(height: 15),
                                      Text("Phone: ${value.companyphone}"),
                                      const SizedBox(height: 15),
                                      Text("Email: ${value.companyemail}"),
                                    ],
                                  ),
                                )
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                                child: SizedBox(
                                  height: 250,
                                  //color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("About Us"),
                                            Text("Who We Are"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Secure Products"),
                                            Text("Project"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("About Our Shop"),
                                            Text("Our Services"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Privacy And Policy"),
                                            Text("SiteMap"),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Delivery Information"),
                                            Text("Contact"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                                child: SizedBox(
                                  height: 250,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                                      const SizedBox(height: 20),
                                      const Text("Get E-mail updates about our latest shop and special offers."),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 2,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: 'Enter your mail',
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: InputBorder.none
                                                ),
                                              )
                                          ),
                                          Expanded(
                                              child: Container(
                                                height: 50,
                                                color: Global.mainColor,
                                                child: const Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("SUBSCRIBE", style: TextStyle(color: Colors.white),),
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const SocialMediaIcons(),
                                    ],
                                  ),
                                  //color: Colors.red,
                                )
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text('Copyright ©2024 All rights reserved', style: TextStyle(fontSize: 15),),
                                SizedBox(width: 10),
                                Text('|'),
                                SizedBox(width: 10),
                                Text('Powered By KologSoft', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/visa1.png", height: 50,),
                                const SizedBox(width: 10),
                                Image.asset("assets/images/PayPal.png", height: 50,),
                                const SizedBox(width: 10),
                                Image.asset("assets/images/MasterCard1.png", height: 50,),
                                //Image.asset("assets/images/payout.png", height: 100,)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
