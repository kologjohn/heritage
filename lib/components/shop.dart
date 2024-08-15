import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jona/components/global.dart';
import 'package:jona/controller/controller.dart';
import 'package:jona/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import '../controller/dbfields.dart';
import '../widgets/featured_product.dart';
import '../widgets/featuredgridview.dart';
import '../widgets/main_menu.dart';
import '../widgets/menu_type.dart';
import '../widgets/route.dart';
import '../widgets/social_media_icons.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool show=false;
   List<String> urls=[];
   List<Widget> myimage = [];
   String searchQuery = '';

   String shoenum="";
  List<bool> active=[];
  final searchController=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 330.0;

    bool isVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 1200;
    }
    bool isNotVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 1200;
    }
    bool isMobileVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 500;
    }

    int crossAxisCount = (screenWidth / itemWidth).floor();
    if (screenWidth <= 400) {
      crossAxisCount = 2;
    }
    else if (screenWidth <= 600 && screenWidth<800) {
      crossAxisCount = (screenWidth / 200).floor();
    }
    else if(screenWidth >=600 && screenWidth<1000)
    {
      crossAxisCount = (screenWidth / 230).floor();

    }

    if (crossAxisCount <= 1) {
      crossAxisCount = 1;
    }

    return Consumer<Ecom>(
      builder: (BuildContext context, value, Widget? child) {
        if(value.selectedcategory.isNotEmpty){
          searchQuery=value.selectedcategory;
        }
        return Scaffold(
          appBar: AppBar(
            //toolbarHeight: 100,
            title: Visibility(
              visible: isVisible(),
              child: Container(
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
                        const Row(
                          children: [
                            MainMenu()
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
                                    onChanged: (txt){
                                      setState(() {
                                        searchQuery=txt;

                                      });
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Search by Item name,category or price?',
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
            ),
            backgroundColor: Colors.lightGreen[50],
          ),
          drawer: Visibility(
            visible: isNotVisible(),
              child: SideDrawer(dWidth: 400)
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 10),
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Visibility(
                            visible: isNotVisible(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                          const SizedBox(height: 20),
                          Visibility(
                            visible: isNotVisible(),
                            child: Column(
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
                                            color: Global.mainColor,
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
                                                          String categoryName = snapshot.data!.docs[index]['name'];
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
                                                                        shoenum=categoryName;
                                                                      });
                                                                    },
                                                                    child: MenuType(
                                                                        isSelected: false,
                                                                        coffeeType: categoryName
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
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: isVisible(),
                                child: Expanded(
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
                                                                value.selected_category("");
                                                                searchQuery=cate;
                                                              });
                                                              // setState(() {
                                                              //   shoenum=Ecom().capitalizeSentence(cate);
                                                              //   querysnapshot=Dbfields.db.collection("items").where(ItemReg.category,isEqualTo: cate).snapshots();
                                                              //   if(active[index])
                                                              //   {
                                                              //     active.add(false);
                                                              //   } else{
                                                              //     active[index]=true;
                                                              //   }
                                                              //
                                                              // });
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
                                      SizedBox(
                                        height: 1200,
                                        child: StreamBuilder<QuerySnapshot>(
                                         stream: Dbfields.db.collection("items").orderBy(ItemReg.category).snapshots(),
                                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                                           if(!snapshot.hasData){
                                            return const Text("Loading...");
                                          }
                                          else if(snapshot.connectionState==ConnectionState.waiting)
                                          {
                                            const CircularProgressIndicator();
                                          }
                                          else if(snapshot.hasError)
                                          {
                                            return const Text("Error Loading Data");
                                          }
                                           urls.clear();
                                           myimage.clear();
                                           var filteredDocs = snapshot.data!.docs.where((doc) {
                                             var data = doc.data() as Map<String, dynamic>;
                                             String item = data['item']?.toString().toLowerCase() ?? '';
                                             String category = data['category']?.toString().toLowerCase() ?? '';
                                             String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                                             return item.contains(searchQuery.toLowerCase()) || category.contains(searchQuery.toLowerCase() )||price.contains(searchQuery.toLowerCase());

                                           }).toList();
                                           // for(int i=0;i<snapshot.data!.docs.length;i++){
                                           //   //print(i);
                                           //   String url= snapshot.data!.docs[i][ItemReg.itemurl];
                                           //   urls.add(url);
                                           //
                                           //   //print(url);
                                           //
                                           //
                                           // }
                                          return GridView.builder(
                                            itemCount: filteredDocs.length,
                                            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 0.6,
                                              childAspectRatio: 0.7,
                                              crossAxisCount: crossAxisCount.ceil(),
                                            ), itemBuilder: (BuildContext context, int index) {
                                            final fetchedData = filteredDocs[index];
                                            String itemname=fetchedData['item'];
                                            String url=fetchedData['itemurl'];
                                            String sellingprice=fetchedData[ItemReg.sellingprice];

                                            return FittedBox(
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      // print(widget.name);
                                                      Navigator.pushNamed(context, Routes.singleProduct,arguments: {"name":snapshot.data!.docs[index][ItemReg.code]});
                                                    },
                                                    child: Container(
                                                      // height: 300,
                                                      width: 220,
                                                      child: FeaturedProduct(
                                                        featuredImage:url,
                                                        featuredName: itemname,
                                                        featuredPrice: sellingprice,
                                                        image: CachedNetworkImage(
                                                          errorListener:(rr){
                                                            //print("${name_txt} image are not uploaded yet");
                                                          } ,
                                                          imageUrl: url,
                                                          height: 200,
                                                          width: 400,
                                                          fit: BoxFit.cover,
                                                          placeholder: (context, url) => const Center(
                                                            child: SizedBox(
                                                              height: 50,
                                                              width: 50,
                                                              child: CircularProgressIndicator(),
                                                            ),
                                                          ),
                                                          errorWidget: (context, url, error) =>Icon(Icons.error,color: Colors.red,),

                                                        ),
                                                        progress: false,
                                                        consWidth: itemWidth,
                                                      ),
                                                    ),
                                                  )
                                                  // items[index]

                                                ],
                                              ),
                                            );
                                          },);
                                          // Wrap(
                                          // runSpacing: 5,
                                          // spacing: 5,
                                          // children: items
                                          // );

                                        },
                                      )

                                //featuredGridview(shoenum: shoenum, widgth: 300, height: 200, name: 16, price: 16, favHeight: 30, favWidth: 100, favSize: 25, cartHeight: 30, cartWidth: 100, cartSize: 25, querySnapshot: querysnapshot,),
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
                Visibility(
                  visible: isVisible(),
                  child: Container(
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
                ),
                Visibility(
                  visible: isNotVisible() && !isMobileVisible(),
                  child: Container(
                    height: 400,
                    color: Colors.lightGreen[50],
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 50),
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
                                        Expanded(child: Text(value.companyname, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)),
                                        const SizedBox(height: 20),
                                        Expanded(child: Text("Address: ${value.companyaddress}")),
                                        const SizedBox(height: 15),
                                        Expanded(child: Text("Phone: ${value.companyphone}")),
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
                                          Text("USEFUL LINKS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
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
                                        const Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
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
                ),
                Visibility(
                  visible: isMobileVisible(),
                  child: Container(
                    height: 690,
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
                                  Text(value.companyname, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                                  const SizedBox(height: 8),
                                  Text("Address: ${value.companyaddress}"),
                                  const SizedBox(height: 6),
                                  Text("Phone: ${value.companyphone}"),
                                  const SizedBox(height: 6),
                                  Text("Email: ${value.companyemail}"),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("JOIN OUR NEWSLETTER NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                              SizedBox(height: 20),
                              Text("Get E-mail updates about our latest shop and special offers."),
                            ],
                          ),
                          const SizedBox(height: 8),
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
