import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import '../constanst.dart';
import '../controller/dbfields.dart';
import '../forms/login.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/menu_type.dart';
import '../widgets/social_media_icons.dart';

class MobileShop extends StatefulWidget {
  const MobileShop({super.key});

  @override
  State<MobileShop> createState() => _MobileShopState();
}

class _MobileShopState extends State<MobileShop> {
  bool show=false;
  bool editShow=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(Companydata.companyname,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
        //title: const Text("APPBAR"),
      ),
      drawer: Drawer(
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
                      signin(context);
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
            const ExpansionTile(
              leading: Icon(Icons.menu, color: Colors.white54,),
              title: Text("MENU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              collapsedIconColor: Colors.white54,
              childrenPadding: EdgeInsets.only(left: 30),
              collapsedBackgroundColor: Colors.black54,
              backgroundColor: Colors.grey,
              children: [
                ListTile(
                  title: MenuType(isSelected: true, coffeeType: 'HOME'),
                ),
                ListTile(
                  title: MenuType(isSelected: false, coffeeType: 'SHOP'),
                ),
                ListTile(
                  title: MenuType(isSelected: false, coffeeType: 'BLOG'),
                ),
                ListTile(
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
                  Text(Companydata.companyname, style: TextStyle(fontSize: 12),),
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
                  Text(Companydata.address, style: TextStyle(fontSize: 12),),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite),
                          SizedBox(width: 10),
                          Icon(Icons.shopping_bag),
                          SizedBox(width: 20),
                          Text("Item:"),
                          SizedBox(width: 10),
                          Text("500.00"),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
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

                                    //print("success");
                                  });
                                },
                                child: Container(
                                  color: Colors.orange,
                                  height: 50,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20.0, right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.menu, color: Colors.white,),
                                            Text("ALL CATEGORIES", style: TextStyle(color: Colors.white),
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
                                  height: 500,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0,top: 20),
                                        child: SizedBox(height: 300,
                                          child: StreamBuilder<QuerySnapshot>(
                                              stream: Dbfields.db.collection("category").snapshots(),
                                              builder: (context, snapshot) {
                                                if(!snapshot.hasData)
                                                {
                                                  return const Text("No data yet");

                                                }
                                                return ListView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: snapshot.data!.docs.length,
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
                                    ],
                                  ),
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
                        children: [
                          const Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'What do you want?',
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
                                    Text("SEARCH"),
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
                          CircleAvatar(
                            backgroundColor: Colors.lightGreen[50],
                            child: const Icon(
                                Icons.call
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Companydata.phone, style: TextStyle(fontWeight: FontWeight.bold),),
                              const Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            color: Colors.lightGreen[50],
                            height: 400,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(Imagesurls.d2, fit: BoxFit.cover,),
                                Center(
                                  child: Container(
                                    height: 300,
                                    color: Colors.lightBlue.withOpacity(0.2),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.lightBlue.withOpacity(0.6),
                                          child: const Column(
                                            children: [
                                              TypeWriterText(
                                                text: Text('HAND WOVEN \n BASKETS \n 100% ORGANIC \n Free pickup delivery available',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold
                                                    )
                                                ),
                                                repeat: true,
                                                duration: Duration(milliseconds: 50),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: (){},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                                              if (states.contains(MaterialState.pressed)) {
                                                return Colors.orange.withOpacity(0.5);
                                              }
                                              return Colors.orange; // Default color
                                            }),
                                          ),
                                          child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
                                        )

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              "Sort by",
                            style: TextStyle(fontSize: 20),
                          ),
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
                      Divider(
                        color: Colors.orange,
                        indent: 150,
                        endIndent: 150,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          SizedBox(width: 10,),
                          Text("Items Found", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 15),
                      featuredGridview(shoenum: 1, widgth: 250, height: 250, imgHeight: 200, imgWidth: 250, name: 12, price: 12, favHeight: 25, favWidth: 60, favSize: 25, cartHeight: 25, cartWidth: 60, cartSize: 25),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              height: 650,
              color: Colors.lightGreen[50],
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Companydata.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                            const SizedBox(height: 8),
                            const Text("Address: Commercial Street, Bolgatanga"),
                            const SizedBox(height: 6),
                            const Text("Phone: +122 553 354 349"),
                            const SizedBox(height: 6),
                            Text("Email: ${Companydata.email}"),
                          ],
                        )
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("About Us"),
                            Text("Who We Are"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Secure Products"),
                            Text("Project"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("About Our Shop"),
                            Text("Our Services"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Privacy And Policy"),
                            Text("SiteMap"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Information"),
                            Text("Contact"),
                          ],
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                        SizedBox(height: 20),
                        Text("Get E-mail updates about our latest shop and special offers."),
                      ],
                    ),
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
                    const SizedBox(height: 12,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaIcons(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const Column(
                      children: [
                        Text('Copyright ©2024 All rights reserved.', style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10),
                        Text('Powered By KologSoft', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}