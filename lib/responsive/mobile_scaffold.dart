import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:jona/constanst.dart';
import 'package:jona/controller/controller.dart';
import 'package:jona/controller/dbfields.dart';
import 'package:jona/widgets/route.dart';
import 'package:jona/widgets/side_menu.dart';
import 'package:jona/widgets/social_media_icons.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/menu_type.dart';


class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  String shoenum="";
  bool show=false;
  bool showoptionmenu=false;
  bool editShow=true;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Consumer<Ecom>(
        builder: (BuildContext context, Ecom value, Widget? child) {
          if(value.auth.currentUser!=null)
            {
              showoptionmenu=true;
            }
          return Scaffold(
            appBar: AppBar(

              actions: [
                Visibility(
                  visible: showoptionmenu,
                  child: PopupMenuButton<String>(
                   // iconColor: Colors.white,
                    onSelected: (text) async{
                      print("selected");

                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'email',
                        child: Row(children: [const Icon(Icons.email,color: Colors.green,),Text("${value.user_email}")],),
                      ),
                      PopupMenuItem<String>(
                        value: 'name',
                        child: Row(children: [
                          Icon(Icons.person,color: Colors.green,),
                          Text("${value.user_lastname}")
                        ],
                        ),
                      ),
                       PopupMenuItem<String>(
                        onTap: ()async{
                          final progress=ProgressHUD.of(context);
                          progress!.show();
                          await value.signout();
                          progress.dismiss();
                        },
                        value: 'Logout',
                        child: Row(children: [Icon(Icons.logout,color: Colors.green,),Text(' Logout')],),
                      ),
                    ],
                  ),
                ),

              ],
              //backgroundColor: Colors.orange,
              // actions:  [
              //   Padding(
              //     padding: const EdgeInsets.only(right: 10.0),
              //     child: Text(Companydata.companyname,
              //       style: const TextStyle(
              //           fontSize: 25,
              //           fontWeight: FontWeight.w600
              //       ),
              //     ),
              //   ),
              // ],
              centerTitle: true,
              title: Text(Companydata.companyname,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            drawer: const SideDrawer(dWidth: 350),
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
                                                          String cate = snapshot.data!.docs[index]['name'];
                                                          return  InkWell(
                                                            onTap: (){},
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.all(4.0),
                                                                  child: InkWell(
                                                                    onTap: (){
                                                                      setState(() {
                                                                        shoenum=cate;
                                                                      });
                                                                    },
                                                                    child: MenuType(
                                                                        isSelected: false,
                                                                        coffeeType: cate
                                                                    ),
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
                                    Text(Companydata.phone, style: const TextStyle(fontWeight: FontWeight.bold),),
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
                                                    //  const Text(
                                                    //    "FRUIT FRESH",
                                                    //    style: TextStyle(
                                                    //        color: Colors.orange,
                                                    //        fontWeight: FontWeight.w600,
                                                    //        fontSize: 20
                                                    //    ),
                                                    //  ),
                                                    //  //const SizedBox(height: 8),
                                                    //  const Text(
                                                    //    "VEGETABLE",
                                                    //    style: TextStyle(
                                                    //        color: Colors.black,
                                                    //        fontWeight: FontWeight.w600,
                                                    //        fontSize: 20
                                                    //    ),
                                                    //  ),
                                                    //  //const SizedBox(height: 15),
                                                    //  const Text(
                                                    //    "100% ORGANIC",
                                                    //    style: TextStyle(
                                                    //        color: Colors.black,
                                                    //        fontWeight: FontWeight.w600,
                                                    //        fontSize: 20
                                                    //    ),
                                                    //  ),
                                                    // // const SizedBox(height: 8),
                                                    //  const Text(
                                                    //    "Free pickup delivery available",
                                                    //    style: TextStyle(
                                                    //      color: Colors.black,
                                                    //      fontSize: 20,
                                                    //    ),
                                                    //  ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: (){
                                                  Navigator.pushNamed(context, Routes.mainShop);

                                                },
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                    if (states.contains(MaterialState.pressed)) {
                                                      return Colors.orange.withOpacity(0.5); // Color when pressed
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
                        const SizedBox(height: 20),
                        // const SizedBox(
                        //   height: 320,
                        //   //color: Colors.red,
                        //   child: ScrollLoopAutoScroll(
                        //     scrollDirection: Axis.horizontal,
                        //     delay: Duration(seconds: 4),
                        //     duration: Duration(seconds: 50),
                        //     gap: 0,
                        //     reverseScroll: false,
                        //     duplicateChild : 25,
                        //     enableScrollInput : false,
                        //     delayAfterScrollInput : Duration(seconds: 4),
                        //     child:  SlideTile(
                        //         slideImagePath: "assets/images/chair.png",
                        //         slideName: "Stuffing Chair",
                        //         slidePrice: "500.00"
                        //     ),
                        //   ),
                        // ),
                        Column(
                          children: [
                            const Text("FEATURED PRODUCTS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                            const Divider(
                              color: Colors.orange,
                              indent: 140,
                              endIndent: 140,
                              thickness: 5,
                            ),
                            //const SizedBox(height: 30),
                            // SizedBox(height: 50,
                            //   child: ListView(
                            //     scrollDirection: Axis.horizontal,
                            //     children: const [
                            //       MenuType(
                            //           isSelected: true,
                            //           coffeeType: "ALL"
                            //       ),
                            //       SizedBox(width: 8),
                            //       MenuType(
                            //           isSelected: false,
                            //           coffeeType: "ELECTRONICS"
                            //       ),
                            //       SizedBox(width: 8),
                            //       MenuType(
                            //           isSelected: false,
                            //           coffeeType: "WINE"
                            //       ),
                            //       SizedBox(width: 8),
                            //       MenuType(
                            //           isSelected: false,
                            //           coffeeType: "VEGETABLES"
                            //       ),
                            //       SizedBox(width: 8),
                            //       MenuType(
                            //           isSelected: false,
                            //           coffeeType: "FRUITS"
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            featuredGridview(shoenum: shoenum, widgth: 250, height: 250,name: 12, price: 12, favHeight: 25, favWidth: 60, favSize: 25, cartHeight: 25, cartWidth: 60, cartSize: 25, querySnapshot: Ecom.querysnapshot,),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  height: 200,
                                  color: Colors.lightBlue[50],
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(Imagesurls.d2, height: 180, width: 180,)
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 35.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "STUFFING CHAIR",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 15
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                const Text(
                                                  "Quality And Durable",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                ElevatedButton(
                                                  onPressed: (){
                                                    Navigator.pushNamed(context, Routes.mainShop);
                                                    print("Printing...");
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                      if (states.contains(MaterialState.pressed)) {
                                                        return Colors.orange.withOpacity(0.5); // Color when pressed
                                                      }
                                                      return Colors.orange; // Default color
                                                    }),
                                                  ),
                                                  child: const Text("SHOP NOW", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                )

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  height: 200,
                                  color: Colors.lightGreen[50],
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(Imagesurls.d2, height: 180, width: 180,)
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 35.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "STUFFING CHAIR",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 15
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                const Text(
                                                  "Quality And Durable",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                ElevatedButton(
                                                  onPressed: (){
                                                    Navigator.pushNamed(context, Routes.mainShop);
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                      if (states.contains(MaterialState.pressed)) {
                                                        return Colors.orange.withOpacity(0.5); // Color when pressed
                                                      }
                                                      return Colors.orange; // Default color
                                                    }),
                                                  ),
                                                  child: const Text("SHOP NOW", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                )

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const Column(
                          children: [
                            Text("FROM THE BLOG", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                            Divider(
                              color: Colors.orange,
                              indent: 140,
                              endIndent: 140,
                              thickness: 5,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                                  height: 600,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.d2, height: 400,width: 400,),),
                                      const SizedBox(height: 10),
                                      const Row(
                                        children: [
                                          Icon(Icons.calendar_today, size: 18,),
                                          SizedBox(width: 4),
                                          Text("February 18, 2024"),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Icon(Icons.comment, size: 18,),
                                              SizedBox(width: 4),
                                              Text("10")
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const Row(
                                        children: [
                                          Text("COMFORTABLE STUFFING CHAIRS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        children: [
                                          Text("Stuffing is the soft material inside pillows, "
                                              "\n mattresses, or sofa cushions. Without stuffing, "
                                              "\n your comfy chair wouldn't be very comfy.",
                                            style: TextStyle(color: Colors.black54),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                                  height: 600,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.d2, height: 400,width: 400,),),
                                      const SizedBox(height: 10),
                                      const Row(
                                        children: [
                                          Icon(Icons.calendar_today, size: 18,),
                                          SizedBox(width: 4),
                                          Text("February 18, 2024"),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Icon(Icons.comment, size: 18,),
                                              SizedBox(width: 4),
                                              Text("10")
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const Row(
                                        children: [
                                          Text("COMFORTABLE STUFFING CHAIRS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        children: [
                                          Text("Stuffing is the soft material inside pillows, "
                                              "\n mattresses, or sofa cushions. Without stuffing, "
                                              "\n your comfy chair wouldn't be very comfy.",
                                            style: TextStyle(color: Colors.black54),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                                  height: 600,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Container(color: Colors.lightBlue[50],child: Image.asset(Imagesurls.d2, height: 400,width: 400,),),
                                      const SizedBox(height: 10),
                                      const Row(
                                        children: [
                                          Icon(Icons.calendar_today, size: 18,),
                                          SizedBox(width: 4),
                                          Text("February 18, 2024"),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Icon(Icons.comment, size: 18,),
                                              SizedBox(width: 4),
                                              Text("10")
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const Row(
                                        children: [
                                          Text("COMFORTABLE STUFFING CHAIRS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Row(
                                        children: [
                                          Text("Stuffing is the soft material inside pillows, "
                                              "\n mattresses, or sofa cushions. Without stuffing, "
                                              "\n your comfy chair wouldn't be very comfy.",
                                            style: TextStyle(color: Colors.black54),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
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
        },

      ),
    );
  }
}

