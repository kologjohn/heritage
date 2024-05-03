import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../controller/dbfields.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String shoenum="";
  List<bool> active=[];
  final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
                        child: MenuType(
                            isSelected: true,
                            coffeeType: "HOME"
                        ),
                      ),
                      SizedBox(width: 40),
                      MenuType(
                          isSelected: false,
                          coffeeType: "SHOP"
                      ),
                      SizedBox(width: 40),
                      MenuType(
                          isSelected: false,
                          coffeeType: "PAGES"
                      ),
                      SizedBox(width: 40),
                      MenuType(
                          isSelected: false,
                          coffeeType: "BLOG"
                      ),
                      SizedBox(width: 40),
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
                                print(searchController.text);
                                setState(() {
                                  shoenum=searchController.text.trim().toUpperCase();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'What do you need?',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),

                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        color: Colors.orange,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.singleProduct);
                          },
                          child: const Icon(Icons.favorite)
                      ),
                      const SizedBox(width: 40),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.cart);
                          },
                          child: const Icon(Icons.shopping_cart)
                      ),
                      SizedBox(width: 40),
                      Text("Item: 500 USD", style: TextStyle(fontSize: 18),)
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
        child: Padding(
          padding: const EdgeInsets.only(left: 130.0, right: 130, top: 10),
          child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   height: 50,
                  //   color: Colors.lightGreen[50],
                  //   child: FittedBox(
                  //     fit: BoxFit.contain,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           const Row(
                  //             children: [
                  //               MenuType(
                  //                   isSelected: true,
                  //                   coffeeType: "HOME"
                  //               ),
                  //               SizedBox(width: 40),
                  //               MenuType(
                  //                   isSelected: false,
                  //                   coffeeType: "SHOP"
                  //               ),
                  //               SizedBox(width: 40),
                  //               MenuType(
                  //                   isSelected: false,
                  //                   coffeeType: "PAGES"
                  //               ),
                  //               SizedBox(width: 40),
                  //               MenuType(
                  //                   isSelected: false,
                  //                   coffeeType: "BLOG"
                  //               ),
                  //               SizedBox(width: 40),
                  //               MenuType(
                  //                   isSelected: false,
                  //                   coffeeType: "CONTACT"
                  //               ),
                  //             ],
                  //           ),
                  //           const SizedBox(width: 120),
                  //           Row(
                  //             children: [
                  //               const SizedBox(
                  //                 height: 50,
                  //                 width: 500,
                  //                 child: Column(
                  //                   children: [
                  //                     TextField(
                  //                       decoration: InputDecoration(
                  //                         hintText: 'What do you need?',
                  //                         hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  //
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //               Container(
                  //                 height: 50,
                  //                 width: 200,
                  //                 color: Colors.orange,
                  //                 child: const Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           const SizedBox(width: 120),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               InkWell(
                  //                   onTap: (){
                  //                     Navigator.pushNamed(context, Routes.singleProduct);
                  //                   },
                  //                   child: const Icon(Icons.favorite)
                  //               ),
                  //               const SizedBox(width: 40),
                  //               InkWell(
                  //                   onTap: (){
                  //                     Navigator.pushNamed(context, Routes.cart);
                  //                   },
                  //                   child: const Icon(Icons.shopping_cart)
                  //               ),
                  //               SizedBox(width: 40),
                  //               Text("Item: 500 USD", style: TextStyle(fontSize: 18),)
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                                    color: Colors.orange,
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
                                  height: 500,
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
                                                      shoenum=cate;
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
                                  featuredGridview(shoenum: shoenum, widgth: 300, height: 200, imgHeight: 400, imgWidth: 250, name: 16, price: 16, favHeight: 30, favWidth: 100, favSize: 25, cartHeight: 30, cartWidth: 100, cartSize: 25)
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
      ),
    );
  }
}
