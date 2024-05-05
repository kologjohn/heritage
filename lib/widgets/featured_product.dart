import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';

class featured_product extends StatefulWidget {
  final String featuredImage;
  final String featuredName;
  final String featuredPrice;
  final bool pgress;
  final double contwidth;
  final double contheight;
  final double nameSize;
  final double priceSize;
  final double favHeight;
  final double favWidth;
  final double favSize;
  final double cartHeight;
  final double cartWidth;
  final double cartSize;
  const featured_product({super.key, required this.featuredImage, required this.featuredName, required this.featuredPrice,required this.pgress, required this.contwidth, required this.contheight, required this.nameSize, required this.priceSize, required this.favHeight, required this.favWidth, required this.favSize, required this.cartHeight, required this.cartWidth, required this.cartSize});

  @override
  State<featured_product> createState() => _featured_productState();
}

class _featured_productState extends State<featured_product> {
  bool myprogess=false;
  bool cartshow=true;
  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(
      builder: (BuildContext context, value,child) {
       // value.companyinfo();
        return Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: SizedBox(
                width: widget.contwidth,
                height: widget.contheight,
                child:CachedNetworkImage(
                  imageUrl: widget.featuredImage,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.white, BlendMode.colorDodge)
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Transform.scale(scale:0.4,child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,size: 40,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white30.withOpacity(0.4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                        children: [
                          Text(widget.featuredName, style: TextStyle(fontSize: widget.nameSize)),
                          Text('\$${widget.featuredPrice}', style: TextStyle(fontSize: widget.priceSize),),
                        ],
                      ),),

                      SizedBox(height: 20),
                      Visibility(
                        visible: cartshow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Expanded(
                            //   child: Container(
                            //     height: widget.favHeight,
                            //     width: widget.favWidth,
                            //     color: Colors.green[200],
                            //     child: Icon(
                            //       Icons.favorite, size: widget.favSize, color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(width: 10),
                            //const Icon(Icons.shopping_cart_checkout, size: 18,),
                            Expanded(
                              child: InkWell(
                                  onTap: ()async{
                                    setState(() {
                                      myprogess=true;
                                      cartshow=false;
                                    });
                                    print(widget.featuredName);
                              
                                    final addcart=await value.addtocart(widget.featuredName, widget.featuredPrice, "1", widget.featuredName);
                                    if(!value.cardstatus)
                                      {
                                        SnackBar snackbar=SnackBar(content: Text(value.error,style:const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),backgroundColor: Colors.deepOrangeAccent,);
                                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                        myprogess=false;
                                        cartshow=true;
                                      }
                                    if(addcart[0]){
                                      SnackBar snackbar=SnackBar(content: Text("${widget.featuredName} added successfully",style:const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),backgroundColor: Colors.green,);
                                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                      setState(() {
                                        myprogess=false;
                                        cartshow=true;
                                      });
                              
                              
                                    }
                                    //String? email=Dbfields.auth.currentUser!.email;
                              
                                  },
                                  child: Container(
                                    height: widget.cartHeight,
                                    width: widget.cartWidth,
                                    color: Colors.orange[200],
                                    child: Icon(
                                      Icons.shopping_cart,size: widget.cartSize, color: Colors.white,
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(visible:myprogess,child: const SizedBox(height:20,width:20,child: CircularProgressIndicator(color: Colors.orange,strokeWidth: 4,))),

                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}