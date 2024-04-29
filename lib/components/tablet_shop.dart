import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jona/constanst.dart';
import 'package:jona/controller/controller.dart';
import 'package:jona/widgets/featuredgridview.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/social_media_icons.dart';

class TabletShop extends StatefulWidget {
  const TabletShop({super.key});

  @override
  State<TabletShop> createState() => _TabletShopState();
}

class _TabletShopState extends State<TabletShop> {
  bool show=false;
  bool editShow=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Ecom>(
        builder: (BuildContext context, Ecom value, Widget? child) {
          if(value.companyaddress.isEmpty)
          {
            value.companyinfo();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, right: 100),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    //color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(Companydata.companyname,
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                        const Icon(Icons.menu, size: 40,)
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.favorite),
                              const SizedBox(width: 20),
                              InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, Routes.cart);
                                  },
                                  child: const Icon(Icons.shopping_cart)),
                              const SizedBox(width: 20),
                              const Text("Item")
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                    onTap: ()async{
                                      setState(() {
                                        if(show==false)
                                        {
                                          show=true;
                                        }
                                        else if(show==true)
                                        {
                                          show=false;
                                        }
                                        //show=true;
                                      });
                                    },
                                    child: Container(
                                      color: Colors.orange,
                                      height: 50,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 18.0, right: 18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.menu, color: Colors.white,),
                                                Text(
                                                  "BASKETS CATEGORIES",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                )
                                              ],
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
                                  )
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Visibility(
                                    visible: show,
                                    child: Container(
                                      height: 400,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20.0,top: 20),
                                        child: SizedBox(height: 300,
                                          child:StreamBuilder<QuerySnapshot>(
                                              stream: value.db.collection("category").snapshots(),
                                              builder: (context, snapshot) {
                                                if(!snapshot.hasData)
                                                {
                                                  return Text("No data yet");

                                                }
                                                return ListView.builder(
                                                  itemCount: snapshot.data!.docs.length,
                                                  scrollDirection: Axis.vertical,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return  InkWell(
                                                      onTap: (){},
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(4.0),
                                                            child: MenuType(
                                                                isSelected: false,
                                                                coffeeType: snapshot.data!.docs[index]['name']
                                                            ),
                                                          ),
                                                          Divider(thickness: 1,color: Colors.grey[200],),

                                                        ],
                                                      ),
                                                    );

                                                  },
                                                );
                                              }
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    height: 60,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("All Categories"),
                                            const Icon(Icons.arrow_drop_down),
                                            const SizedBox(width: 30),
                                            const SizedBox(
                                              height: 50,
                                              width: 300,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'What do you need?',
                                                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 80,
                                              color: Colors.orange,
                                              child: const Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.lightGreen[50],
                                              child: const Icon(
                                                Icons.call, color: Colors.orange,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(value.companyphone, style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sort by",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(width: 20),
                              Row(
                                children: [
                                  Text(
                                    "Default",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              )
                            ],
                          ),
                          // Divider(
                          //   color: Colors.orange,
                          //   indent: 150,
                          //   endIndent: 150,
                          //   thickness: 2,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              SizedBox(width: 10,),
                              Text("Items Found", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          featuredGridview(shoenum: 3, widgth: 250, height: 150, imgHeight: 300, imgWidth: 200, name: 14, price: 14, favHeight: 30, favWidth: 80, favSize: 20, cartHeight: 30, cartWidth: 80, cartSize: 20)
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.lightGreen[50],
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 100.0, right: 100, top: 50),
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
                                      Expanded(child: Text(Companydata.companyname, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),)),
                                      const SizedBox(height: 20),
                                      Expanded(child: Text(value.companyaddress)),
                                      const SizedBox(height: 15),
                                      Expanded(child: Text(value.companyphone)),
                                      const SizedBox(height: 15),
                                      Expanded(child: Text("Email: ${value.companyaddress}")),
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
                                        Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
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
                                      const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
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
                                                    filled: true
                                                ),
                                              )
                                          ),
                                          Expanded(
                                              child: Container(
                                                height: 50,
                                                color: Colors.orange,
                                                child: const Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("SUBSCRIBE"),
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
          );
        },
      ),
    );
  }
}
