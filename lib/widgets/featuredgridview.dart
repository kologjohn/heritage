import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:jona/controller/controller.dart';
import 'package:jona/widgets/route.dart';

import '../controller/dbfields.dart';
import 'featured_product.dart';
class featuredGridview extends StatefulWidget {
  final String shoenum;
  final double widgth;
  final double height;
  final double name;
  final double price;
  final double favHeight;
  final double favWidth;
  final double favSize;
  final double cartHeight;
  final double cartWidth;
  final double cartSize;
  final  querySnapshot;
  const featuredGridview({super.key, required this.shoenum, required this.widgth,required this.height, required this.name, required this.price, required this.favHeight, required this.favWidth, required this.favSize, required this.cartHeight, required this.cartWidth, required this.cartSize, required this.querySnapshot,});

  @override
  State<featuredGridview> createState() => _featuredGridviewState();
}

class _featuredGridviewState extends State<featuredGridview> {
  //var itemData;
  @override
  Widget build(BuildContext context) {
    List<Widget> items=[];
    // if(widget.shoenum.isNotEmpty)
    //   {
    //     String value=Ecom().capitalizeEachWord(widget.shoenum);
    //     print(value);
    //     setState(() {
    //       itemData=Dbfields.db.collection("items").orderBy(ItemReg.category).startAt([value]).snapshots();
    //     });
    //   }
    // else{
    //   itemData=Dbfields.db.collection("items").snapshots();
    // }
    return StreamBuilder<QuerySnapshot>(
      stream: widget.querySnapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasData)
        {
          items.clear();
          for(int i=0;i<snapshot.data!.docs.length;i++){
            //print(i);
            String url= snapshot.data!.docs[i][ItemReg.itemurl];
            //print(url);
            items.add(
                InkWell(
                  onTap: (){
                   // print(widget.name);
                    Navigator.pushNamed(context, Routes.singleProduct,arguments: {"name":snapshot.data!.docs[i][ItemReg.code]});
                  },
                  child: Container(
                    // height: 300,
                    width: 200,
                    child: featured_product(
                      featuredImage:url,
                      featuredName: snapshot.data!.docs[i][ItemReg.item],
                      featuredPrice: snapshot.data!.docs[i][ItemReg.sellingprice],
                      pgress: false,
                      contwidth: widget.widgth,
                      contheight: widget.height, nameSize: widget.name, priceSize: widget.price, favHeight: widget.favHeight, favWidth: widget.favWidth, favSize: widget.favSize, cartHeight: widget.cartHeight, cartWidth: widget.cartWidth, cartSize: widget.cartSize,
                    ),
                  ),
                )
            );

          }
          //return ;

        }
        else if(!snapshot.hasData){
          return Text("Loading...");
        }
        else if(snapshot.connectionState==ConnectionState.waiting)
        {
          const CircularProgressIndicator();
        }
        else if(snapshot.hasError)
        {
          return const Text("Error Loading Data");

        }
        return Wrap(
          runSpacing: 5,
          spacing: 5,
          children: items
          );

      },
    );
  }
}