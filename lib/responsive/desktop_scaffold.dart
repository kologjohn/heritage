import 'dart:async';
import '/blog/banner.dart';
import '/components/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/components/global.dart';
import '/constanst.dart';
import '/controller/dbfields.dart';
import '/widgets/options_menu.dart';
import '/widgets/route.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import '../blog/blog_post.dart';
import '../components/categoriesdData.dart';
import '../controller/controller.dart';
import '../footers/desktop_footer.dart';
import '../footers/tablet_footer.dart';
import '../widgets/featured_product.dart';
import '../widgets/main_menu.dart';
import '../widgets/side_menu.dart';
import '../widgets/social_media_icons.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final List<String> imageUrls = [
    Imagesurls.slide1,
    Imagesurls.slide2,
    Imagesurls.slide3,
    Imagesurls.slide4,
    Imagesurls.slide5,
    Imagesurls.heritage6,
  ];
  bool trackingcart=false;
  String purchaseid="";
  final ScrollController _scrollController = ScrollController();
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;


  void _startAutoSlide() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        if (_currentPage < imageUrls.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0; // Reset to the first slide
        }
        if (_pageController.hasClients) {  // Check if the controller is attached
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }


  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
    _startAutoSlide();
    Uri uri = Uri.parse(Uri.base.toString());
    String? id = uri.queryParameters['cartid']??"null";
    if(id!="null") {
      setState(() {
      setState(() {
        trackingcart=true;
        purchaseid=id;
      });
      });
    }
    print(id);
    // TODO: implement initState
    super.initState();
  }
  String searchQuery="";
  String shoenum="";
  bool show=false;
  bool editShow=true;
  bool showoptions=false;

  @override
  Widget build(BuildContext context) {

    //double screenWidth = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.sizeOf(context).width;

    double itemWidth = 400.0;

    bool isVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 1200;
    }
    bool isNotVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth < 1200;
    }

    bool isMainVisible () {
      double screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 500;
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
      crossAxisCount = (screenWidth / 400).floor();
    }
    else if(screenWidth >=600 && screenWidth<1000)
    {
      crossAxisCount = (screenWidth / 400).floor();

    }

    if (crossAxisCount <= 1) {
      crossAxisCount = 1;
    }
    return   Consumer<Ecom>(builder: (context,  value,  child) {
      // if(trackingcart){
      //   value.route(context);
      //  // print(purchaseid);
      //   // Navigator.pushNamed(context, Routes.cart);
      //
      // }
      return Scaffold(
        appBar: AppBar(
          backgroundColor:  Global.appbar,
          title:Visibility(
            visible: isVisible(),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email, size: 18,),
                      const SizedBox(width: 8,),
                      Text(value.companyemail, style:  TextStyle(fontSize: 15,),),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.location_pin, size: 18,),
                      const SizedBox(width: 8),
                      Text(value.companyaddress, style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      const SocialMediaIcons(),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Image.asset(Imagesurls.hats, height: 30, width: 30,),
                          const SizedBox(width: 8),
                          //SvgPicture.asset("assets/svg/gh.svg", width: 40, height: 20,),
                          const Text("Ghana", style: TextStyle(fontSize: 15)),
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
                      InkWell(
                        onTap: (){
                          if(value.auth.currentUser!=null){
                            Navigator.pushNamed(context, Routes.userProfile);
                          }
                          else
                            {
                              Navigator.pushNamed(context, Routes.login);

                            }
                          //itemupload(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 8),
                            Text("Login", style: TextStyle(fontSize: 15))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            options_menu(showoptionmenu: editShow, ecom: value,)
          ],
          automaticallyImplyLeading: isNotVisible(),
        ),
        drawer: Visibility(
            visible: isNotVisible(),
            child:  SideDrawer(dWidth: 350, value: value,)),
        backgroundColor: Colors.grey[200],
        body: ListView(
            children: [
              Padding(
                  padding: MediaQuery.of(context).size.width < 900
                      ? const EdgeInsets.only(left: 5.0, right: 5.0, top: 15)
                      : const EdgeInsets.only(left: 50.0, right: 50.0, top: 15),
                  child: Container(
                    color: Colors.white,
                    //height: 10000,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Visibility(
                              visible: isVisible(),
                              child: Row(
                                children: [
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
                                              children: const [
                                                MainMenu(),
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
                                        child: Container(
                                          color: Global.primaryColor,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                   // Navigator.pushNamed(context, Routes.singleProduct);
                                                  },
                                                  child: const Tooltip(
                                                    message: 'Favorites',

                                                      child: Icon(Icons.favorite,color: Colors.white,)
                                                  )
                                              ),
                                              InkWell(
                                                  onTap: ()async{
                                                    await value.cartidmethod();
                                                    final st=await value.alreadypaid(context);
                                                    Navigator.pushNamed(context, Routes.cart);
                                                  },
                                                  child: const Tooltip(
                                                    message: 'Cart',
                                                      child: Icon(Icons.shopping_cart,color: Colors.white,)
                                                  )
                                              ),
                                              Text("Total: USD ${value.numformat.format(value.mycarttotal)}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ],
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: isVisible(),
                              child: Expanded(
                                flex: 2,
                                child: SizedBox(

                                    height: 500,
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
                                        Visibility(
                                          visible: editShow,
                                          child: Container(
                                            color: Colors.white,
                                            height: 450,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                                              child: Categories(value)
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: isNotVisible(),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: (){
                                                 // Navigator.pushNamed(context, Routes.singleProduct);
                                                },
                                                child: const Icon(Icons.favorite)
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                                onTap: ()async{
                                                  await value.cartidmethod();
                                                  final st=await value.alreadypaid(context);
                                                  print(st);
                                                  Navigator.pushNamed(context, Routes.cart);
                                                },
                                                child: const Icon(Icons.shopping_cart)
                                            ),
                                            const SizedBox(width: 10),
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
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
                                                        child:Categories(value),
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
                                  const SizedBox(height: 12),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                color: Colors.white,
                                                height: 50,
                                                child:  Padding(
                                                  padding: const EdgeInsets.only(right: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Row(
                                                          children: [
                                                            // const Text("All Categories", style: TextStyle(fontWeight: FontWeight.bold),),
                                                            // const SizedBox(width: 20),
                                                            // const Icon(Icons.arrow_drop_dow
                                                            // const SizedBox(width: 30),
                                                            Expanded(
                                                              flex:3,
                                                              child: SizedBox(
                                                                height: 50,
                                                                width: 300,
                                                                child: Column(
                                                                  children: [
                                                                    // TextFormField()
                                                                    TextFormField(

                                                                      decoration: const InputDecoration(
                                                                          hintText: 'What do you need?',
                                                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                                                          //border: InputBorder.none,
                                                                          filled: true,
                                                                          fillColor: Colors.white
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
                                                                color: Global.mainColor,
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

                                                      Visibility(
                                                        visible: isVisible(),
                                                        child: Expanded(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,

                                                            children: [

                                                              CircleAvatar(
                                                                backgroundColor: Global.appbar,
                                                                child: const Icon(
                                                                  Icons.call, color: Global.mainColor,
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
                                  Visibility(
                                    visible: true && !isMainVisible(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: [

                                              CircleAvatar(
                                                backgroundColor: Colors.lightBlue[50],
                                                child: const Icon(
                                                  Icons.call, color: Global.mainColor,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(value.companyphone, style: const TextStyle(fontWeight: FontWeight.bold),),
                                                  const Text("support 24/7 time", style: TextStyle(color: Colors.black54),),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Visibility(
                                    visible: isMainVisible(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        height: 450,
                                        color: Global.appbar,
                                        child:  Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Expanded(
                                            //   child: FittedBox(
                                            //     fit: BoxFit.contain,
                                            //     child: Row(
                                            //       children: [
                                            //         Padding(
                                            //           padding: const EdgeInsets.only(left: 40.0, right: 20),
                                            //           child: Column(
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             mainAxisAlignment: MainAxisAlignment.center,
                                            //             children: [
                                            //               const Text(
                                            //                 "HAND WOVEN",
                                            //                 style: TextStyle(
                                            //                     color: Global.mainColor,
                                            //                     fontWeight: FontWeight.w600,
                                            //                     fontSize: 25
                                            //                 ),
                                            //               ),
                                            //               const SizedBox(height: 8),
                                            //               const Text(
                                            //                 "BASKETS",
                                            //                 style: TextStyle(
                                            //                     color: Colors.black,
                                            //                     fontWeight: FontWeight.w600,
                                            //                     fontSize: 40
                                            //                 ),
                                            //               ),
                                            //               const SizedBox(height: 5),
                                            //               const Text(
                                            //                 "100% NATURAL",
                                            //                 style: TextStyle(
                                            //                     color: Colors.black,
                                            //                     fontWeight: FontWeight.w600,
                                            //                     fontSize: 40
                                            //                 ),
                                            //               ),
                                            //               const SizedBox(height: 8),
                                            //               const Text(
                                            //                 "Free pickup delivery available",
                                            //                 style: TextStyle(
                                            //                     color: Colors.black,
                                            //                     fontSize: 25
                                            //                 ),
                                            //               ),
                                            //               const SizedBox(height: 20),
                                            //               ElevatedButton(
                                            //                 onPressed: (){
                                            //                   Navigator.pushNamed(context, Routes.mainShop);
                                            //                 },
                                            //                 style: ButtonStyle(
                                            //                   backgroundColor: MaterialStateProperty.resolveWith((states) {
                                            //                     if (states.contains(MaterialState.pressed)) {
                                            //                       return Global.mainColor.withOpacity(0.5);
                                            //                     }
                                            //                     return Global.mainColor;
                                            //                   }),
                                            //                 ),
                                            //                 child: const Text("SHOP NOW", style: TextStyle(color: Colors.white, fontSize: 8),),
                                            //               )
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          height: 450,
                                                          color: Global.appbar,
                                                          // Remove fixed height to let it expand fully
                                                          child: CarouselSlider(
                                                            items: [
                                                              Image.asset(Imagesurls.slide1, fit: BoxFit.cover, width: double.infinity),
                                                              Image.asset(Imagesurls.slide2, fit: BoxFit.cover, width: double.infinity),
                                                              Image.asset(Imagesurls.slide3, fit: BoxFit.cover, width: double.infinity),
                                                              Image.asset(Imagesurls.slide4, fit: BoxFit.cover, width: double.infinity),
                                                              Image.asset(Imagesurls.slide5, fit: BoxFit.cover, width: double.infinity),
                                                              Image.asset(Imagesurls.heritage6, fit: BoxFit.cover, width: double.infinity),
                                                              Image.asset(Imagesurls.heritage7, fit: BoxFit.cover, width: double.infinity),
                                                             ],
                                                            options: CarouselOptions(
                                                              aspectRatio: 16 / 9,
                                                              enlargeCenterPage: false,
                                                              autoPlay: true,
                                                              autoPlayInterval: const Duration(seconds: 3),
                                                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                                              enableInfiniteScroll: true,
                                                              autoPlayCurve: Curves.fastOutSlowIn,
                                                              scrollDirection: Axis.horizontal,
                                                              viewportFraction: 0.9, // Ensures no space between images
                                                            ),
                                                          ),
                                                        ),
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
                                  ),
                                  Visibility(
                                    visible: true && !isMainVisible(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.lightGreen[50],
                                              height: 200,
                                              child: PageView.builder(
                                                controller:_pageController,
                                                itemCount: imageUrls.length,
                                                itemBuilder: (context, index) {
                                                  return Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      Image.asset(
                                                        imageUrls[index],
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Center(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [

                                                            ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.pushNamed(context, Routes.mainShop);
                                                                // Add your button action here
                                                              },
                                                              style: ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                                  if (states.contains(MaterialState.pressed)) {
                                                                    return Colors.blue.withOpacity(0.5);
                                                                  }
                                                                  return Colors.blue; // Default color
                                                                }),
                                                              ),
                                                              child: const Text(
                                                                "SHOP NOW",
                                                                style: TextStyle(color: Colors.white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                  // FlashingBanner(),
                                  // ImageCarousel(imageUrls: Imagesurls.carouselImages)

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
                        const SizedBox(height: 50),
                        const Column(
                          children: [
                            Text("FEATURED BASKETS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                            Divider(
                              color: Global.mainColor,
                              indent: 800,
                              endIndent: 800,
                              thickness: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 700,
                            child:FutureBuilder<QuerySnapshot>(
                              future: value.db.collection("items").limit(5).orderBy('date').get(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return ShimmerLoadingList();
                                }  else if (snapshot.hasError) {
                                  return const Text("Error Loading Data");
                                }

                                var filteredDocs = snapshot.data!.docs.where((doc) {
                                  var data = doc.data() as Map<String, dynamic>;
                                  String item = data['item']?.toString().toLowerCase() ?? '';
                                  String category = data['category']?.toString().toLowerCase() ?? '';
                                  String price = data['sellingprice']?.toString().toLowerCase() ?? '';
                                  return item.contains(searchQuery.toLowerCase()) ||
                                      category.contains(searchQuery.toLowerCase()) ||
                                      price.contains(searchQuery.toLowerCase());
                                }).toList();

                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: 5,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 0.6,
                                    childAspectRatio: 0.7,
                                    crossAxisCount: crossAxisCount.ceil(),
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    String weght="0";
                                    String dimension="0";
                                    final fetchedData = filteredDocs[index];
                                    String itemname = fetchedData['item'];
                                    String item_code = fetchedData['code'];
                                    String url = fetchedData['itemurl'];
                                    try{
                                       dimension = fetchedData['dimensions'];
                                       weght = fetchedData['weight'];
                                    }catch(e){

                                    }


                                    String sellingprice = fetchedData[ItemReg.sellingprice];

                                    return FittedBox(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              print(item_code);
                                              value.cartids();
                                              value.cartidmethod();
                                              await value.set_selecteditem(item_code);
                                              value.setnextstate("cart");
                                              await value.get_current_item();
                                              value.item_alreadexist(value.cartidnumber, item_code);
                                              Navigator.pushNamed(context, Routes.singleProduct);
                                            },
                                            child: Container(
                                              width: 220,
                                              child: FeaturedProduct(
                                                dimension: dimension,
                                                weight: weght,
                                                featuredImage: url,
                                                featuredName: itemname,
                                                featuredPrice: sellingprice,
                                                image: CachedNetworkImage(
                                                  placeholder: (context, url) => const Center(
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                  imageUrl: url,
                                                 // placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  fit: BoxFit.cover,
                                                  width: 150,
                                                  height: 150,
                                                ),
                                                progress: false,
                                                consWidth: itemWidth,
                                                frompage: 'shop',
                                                featuredCode: item_code, ecom: value,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            )

                        ),
                        const SizedBox(height: 20),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 80),
                        SizedBox(
                          width: 1300,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              alignment: WrapAlignment.center,
                              children: [
                                BannerPost(title: 'OVAL  BASKETS', subTitle: 'Quality And Durable', imageUrl: Imagesurls.hats, conColor: Colors.lightBlue[50],),
                                BannerPost(title: 'V-SHAPE  BASKETS', subTitle: 'Quality And Durable', imageUrl: Imagesurls.heritage7, conColor: Colors.lightGreen[50]),
                              ],
                            ),
                          )
                        ),
                        const SizedBox(height: 30),
                        Divider(
                          thickness: 10,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 30),
                        const Column(
                          children: [
                            Text("FROM THE BLOG", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                            Divider(
                              color: Global.mainColor,
                              indent: 800,
                              endIndent: 800,
                              thickness: 5,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20),
                          child: SizedBox(
                            width: 1300,
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              alignment: WrapAlignment.center,
                              children: [
                                BlogPost(title: 'TRENDING FASHIONS', mainText: Companydata.blogDescription, date: 'August 18, 2024', comments: '69', imageUrl: Imagesurls.d2,),
                                BlogPost(title: 'BOLGA ROUND BASKETS', mainText: Companydata.blogDescription, date: 'August 23, 2024', comments: '40', imageUrl: Imagesurls.d1,),
                                BlogPost(title: 'INTERIOR DECOR', mainText: Companydata.blogDescription, date: 'August 27, 2024', comments: '30', imageUrl: Imagesurls.hats,),
                                BlogPost(title: 'ARTISANS', mainText: Companydata.blogDescription, date: 'September 08, 2024', comments: '15', imageUrl: Imagesurls.heritage5,),
                              ],
                            )
                          ),
                        ),
                        Divider(
                          thickness: 20,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                  )
              ),
              Visibility(
                visible: false,
                child:  DesktopFooter(value: value,),
              ),
              Visibility(
                visible: true,
                child:  TabletFooter(value: value,),
              ),
            ],

          ),
        );
      },
    );
  }

}





