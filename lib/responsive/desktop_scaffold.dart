import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jona/constanst.dart';
import 'package:jona/controller/dbfields.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import '../controller/controller.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/featured_product.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/social_media_icons.dart';
class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Ecom().companyinfo();
  }
  bool show=false;
  bool editShow=true;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey[200],
      body: Consumer<Ecom>(
        builder: (BuildContext context, Ecom value, Widget? child) {
          if(value.companyemail.isEmpty){
            value.companyinfo();

          }
          return  SingleChildScrollView(
            reverse: false,
            child: Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.lightGreen[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email, size: 18,),
                          const SizedBox(width: 8,),
                          Text(value.companyemail),
                          const SizedBox(width: 10),
                          Container(
                            height: 20,
                            width: 1, // or any desired width
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.location_pin, size: 18,),
                          const SizedBox(width: 8),
                          Text(value.companyaddress),
                        ],
                      ),
                      Row(
                        children: [
                          const SocialMediaIcons(),
                          const SizedBox(width: 10),
                          Container(
                            height: 20,
                            width: 1, // or any desired width
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Image.asset(Imagesurls.hats, height: 20, width: 20,),
                              const SizedBox(width: 8),
                              //SvgPicture.asset("assets/svg/gh.svg", width: 40, height: 20,),
                              const Text("Ghana"),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 20,
                            width: 1, // or any desired width
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          const Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 8),
                              Text("Login")
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 130.0, right: 130.0, top: 15),
                    child: Container(
                      color: Colors.white,
                      //height: 10000,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  // const Expanded(
                                  //     flex: 2,
                                  //     child: SizedBox(
                                  //       //color: Colors.lightBlue[50],
                                  //       height: 50,
                                  //       child: Expanded(
                                  //         child: Column(
                                  //           children: [
                                  //             Expanded(
                                  //               child: Row(
                                  //                 //mainAxisAlignment: MainAxisAlignment.center,
                                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                                  //                 children: [
                                  //                   Expanded(child: Text("RAIN INN MALL", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
                                  //                 ],
                                  //               ),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     )),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      //color: Colors.lightBlue[50],
                                      height: 50,
                                      child:  Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Row(
                                                  children: [
                                                    const MenuType(
                                                        isSelected: true,
                                                        coffeeType: "HOME"
                                                    ),
                                                    const SizedBox(width: 40),
                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.pushNamed(context, Routes.shop);
                                                      },
                                                      child: const MenuType(
                                                          isSelected: false,
                                                          coffeeType: "SHOP"
                                                      ),
                                                    ),
                                                    const SizedBox(width: 40),
                                                    const MenuType(
                                                        isSelected: false,
                                                        coffeeType: "PAGES"
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                        height: 50,
                                        //color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(Icons.favorite),
                                            InkWell(
                                                onTap: (){
                                                  Navigator.pushNamed(context, Routes.cart);
                                                },
                                                child: const Icon(Icons.shopping_cart)),
                                            Text("Item: ${value.cartidnumber}")
                                          ],
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  //color: Colors.white,
                                    height: 600,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: ()async{
                                            setState(() {
                                              if (editShow==true)
                                              {
                                                editShow=false;
                                              }
                                              else {
                                                editShow=true;
                                              }
                                              //editShow=false;
                                            });
                                          },
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
                                        Visibility(
                                          visible: editShow,
                                          child: Container(
                                            color: Colors.white,
                                            height: 550,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                                              child: StreamBuilder<QuerySnapshot>(
                                                  stream: Dbfields.db.collection("category").snapshots(),
                                                  builder: (context, snapshot) {
                                                    if(!snapshot.hasData){
                                                      return const Text("Loading...");
                                                    }
                                                    else if(snapshot.connectionState!=ConnectionState.active){
                                                      return const Text("Connection Error",style: TextStyle(color: Colors.red),);
                                                    }
                                                    else if(snapshot.data!.docs.isEmpty)
                                                    {
                                                      return const Text("Empty Baskets Category");
                                                    }
                                                    return ListView.builder(
                                                      scrollDirection: Axis.vertical,
                                                      itemCount: snapshot.data!.docs.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        String cate=snapshot.data!.docs[index]['name'];
                                                        return Container(child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            MenuType(
                                                                isSelected: false,
                                                                coffeeType: cate
                                                            ),
                                                            Divider(thickness: 1,color: Colors.grey[200],),
                                                            const SizedBox(height: 10),
                                                          ],
                                                        ),);

                                                      },
                                                    );
                                                  }
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  color: Colors.white,
                                                  height: 50,
                                                  child:  Padding(
                                                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Row(
                                                            children: [
                                                              const Text("All Categories", style: TextStyle(fontWeight: FontWeight.bold),),
                                                              const SizedBox(width: 20),
                                                              const Icon(Icons.arrow_drop_down),
                                                              const SizedBox(width: 30),
                                                              const Expanded(
                                                                flex:3,
                                                                child: SizedBox(
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
                                                              ),
                                                              Expanded(
                                                                flex:1,
                                                                child: Container(
                                                                  height: 50,
                                                                  width: 100,
                                                                  color: Colors.orange,
                                                                  child: const Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,

                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor: Colors.lightGreen[50],
                                                                child: const Icon(
                                                                  Icons.call, color: Colors.orange,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 12),
                                                              Flexible(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Expanded(child: Text(value.companyphone, style: const TextStyle(fontWeight: FontWeight.bold),)),
                                                                    const Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        color: Colors.lightBlue[50],
                                        height: 530,
                                        child:  Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 70.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        const Text(
                                                          "HAND WOVEN",
                                                          style: TextStyle(
                                                              color: Colors.orange,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 25
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        const Text(
                                                          "BASKETS",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 40
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5),
                                                        const Text(
                                                          "100% ORGANIC",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 40
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        const Text(
                                                          "Free pickup delivery available",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 25
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        ElevatedButton(
                                                          onPressed: (){},
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
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Image.asset(Imagesurls.d2,height: 400,)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(height: 30),
                          const MyCarousel(enlargeCenter: false, viewPort: 0.2,),
                          // const SizedBox(
                          //   height: 320,
                          //   //color: Colors.red,
                          //   child: ScrollLoopAutoScroll(
                          //     scrollDirection: Axis.horizontal,
                          //     delay: Duration(seconds: 4),
                          //     duration: Duration(seconds: 50),
                          //     gap: 25,
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
                          Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(height: 50),
                          const Column(
                            children: [
                              Text("FEATURED BASKETS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                              Divider(
                                color: Colors.orange,
                                indent: 600,
                                endIndent: 600,
                                thickness: 5,
                              ),
                              SizedBox(height: 30),
                              // SizedBox(
                              //   height: 50,
                              //   child: StreamBuilder<QuerySnapshot>(
                              //       stream: value.db.collection("category").limit(4).snapshots(),
                              //       builder: (context, snapshot) {
                              //         List<Widget> widget=[
                              //           const MenuType(
                              //             isSelected: true,
                              //             coffeeType: "ALL"
                              //         ),];
                              //         if(!snapshot.hasData)
                              //           {
                              //             return Text("No category");
                              //           }
                              //         else
                              //           {
                              //
                              //             for(int i=0;i<snapshot.data!.docs.length;i++){
                              //               widget.add(
                              //                   Padding(
                              //                     padding: const EdgeInsets.symmetric(horizontal: 10),
                              //                     child: MenuType(
                              //                         coffeeType: snapshot.data!.docs[i]['name'], isSelected: false,
                              //                     ),
                              //                   )
                              //               );
                              //
                              //             }
                              //
                              //           }
                              //         return  Row(
                              //           mainAxisAlignment: MainAxisAlignment.center,
                              //           //scrollDirection: Axis.horizontal,
                              //
                              //           children: widget
                              //         );
                              //       }
                              //   ),
                              // ),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              featuredGridview(shoenum: 4, widgth: 250, height: 150, imgHeight: 300, imgWidth: 200, name: 14, price: 14, favHeight: 30, favWidth: 80, favSize: 20, cartHeight: 30, cartWidth: 80, cartSize: 20)
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(height: 80),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 300,
                                      color: Colors.lightBlue[50],
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/chair.png", height: 300, width: 300,)
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "SUMMER FRUIT",
                                                      style: TextStyle(
                                                          color: Colors.orange,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20
                                                      ),
                                                    ),
                                                    //const SizedBox(height: 8),
                                                    const Text(
                                                      "100% Pure Natural Fruit",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20
                                                      ),
                                                    ),
                                                    //const SizedBox(height: 20),
                                                    ElevatedButton(
                                                      onPressed: (){},
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0,),
                                    child: Container(
                                      height: 300,
                                      color: Colors.lightGreen[50],
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/chair.png", height: 300, width: 300,)
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "SUMMER FRUIT",
                                                      style: TextStyle(
                                                          color: Colors.orange,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 20
                                                      ),
                                                    ),
                                                    //const SizedBox(height: 8),
                                                    const Text(
                                                      "100% Pure Natural Fruit",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20
                                                      ),
                                                    ),
                                                    //const SizedBox(height: 20),
                                                    ElevatedButton(
                                                      onPressed: (){},
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(height: 80),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    height: 470,
                                    color: Colors.white,
                                    child: const Column(
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("LATEST PRODUCTS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
                                        SizedBox(
                                          //height: 640,
                                          //color: Colors.red,
                                            child: MyCarousel(enlargeCenter: false, viewPort: 0.5)
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Container(
                                    height: 470,
                                    color: Colors.white,
                                    child: const Column(
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("TOP RATED PRODUCTS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
                                        SizedBox(
                                          //height: 640,
                                          //color: Colors.red,
                                            child: MyCarousel(enlargeCenter: false, viewPort: 0.5)
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Container(
                                    height: 470,
                                    color: Colors.white,
                                    child: const Column(
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("REVIEW PRODUCTS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
                                        SizedBox(
                                          //height: 640,
                                          //color: Colors.red,
                                            child: MyCarousel(enlargeCenter: false, viewPort: 0.5)
                                        ),
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Divider(
                            thickness: 10,
                            color: Colors.grey[200],
                          ),
                          const Column(
                            children: [
                              Text("FROM THE BLOG", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                              Divider(
                                color: Colors.orange,
                                indent: 600,
                                endIndent: 600,
                                thickness: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                    height: 600,
                                    //color: Colors.red,
                                    child: Column(
                                      children: [
                                        Container(color: Colors.lightBlue[50],child: Image.asset("assets/images/chair.png", height: 400,width: 400,),),
                                        const SizedBox(height: 18),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
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
                                        ),
                                        const SizedBox(height: 15),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
                                            children: [
                                              Text("COMFORTABLE STUFFING CHAIRS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
                                            children: [
                                              Text("Stuffing is the soft material inside pillows, "
                                                  "\n mattresses, or sofa cushions. Without stuffing, "
                                                  "\n your comfy chair wouldn't be very comfy.",
                                                style: TextStyle(color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: SizedBox(
                                    height: 600,
                                    //color: Colors.red,
                                    child: Column(
                                      children: [
                                        Container(color: Colors.lightBlue[50],child: Image.asset("assets/images/chair.png", height: 400,width: 400,),),
                                        const SizedBox(height: 18),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
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
                                        ),
                                        const SizedBox(height: 15),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
                                            children: [
                                              Text("COMFORTABLE STUFFING CHAIRS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
                                            children: [
                                              Text("Stuffing is the soft material inside pillows, "
                                                  "\n mattresses, or sofa cushions. Without stuffing, "
                                                  "\n your comfy chair wouldn't be very comfy.",
                                                style: TextStyle(color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: SizedBox(
                                    height: 600,
                                    //color: Colors.red,
                                    child: Column(
                                      children: [
                                        Container(color: Colors.lightBlue[50],child: Image.asset("assets/images/chair.png", height: 400,width: 400,),),
                                        const SizedBox(height: 18),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
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
                                        ),
                                        const SizedBox(height: 15),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
                                            children: [
                                              Text("COMFORTABLE STUFFING CHAIRS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Row(
                                            children: [
                                              Text("Stuffing is the soft material inside pillows, "
                                                  "\n mattresses, or sofa cushions. Without stuffing, "
                                                  "\n your comfy chair wouldn't be very comfy.",
                                                style: TextStyle(color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 20,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                  height: 400,
                  color: Colors.lightGreen[50],
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 300.0, right: 300, top: 50),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: SizedBox(
                                  height: 200,
                                  //color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("RAIN INN MALL", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
                                      SizedBox(height: 20),
                                      Text("Address: Commercial Street, Bolgatanga"),
                                      SizedBox(height: 15),
                                      Text("Phone: +122 553 354 349"),
                                      SizedBox(height: 15),
                                      Text("Email: raininn@gmail.com"),
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
                                        Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
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
                                      const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
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