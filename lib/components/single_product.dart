import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../constanst.dart';


class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  double rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        centerTitle: true,
        title: Text(Companydata.companyname, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    color: Colors.white,
                    height: 100,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Container(
                    width: 1300,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      color: Colors.grey[500],
                                      child: Image.asset(Imagesurls.hats),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      color: Colors.grey[500],
                                      child: Image.asset(Imagesurls.d2),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      color: Colors.grey[500],
                                      child: Image.asset(Imagesurls.d1),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              flex: 5,
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      color: Colors.lightBlue[50],
                                      height: 500,
                                      width: 500,
                                      child: Image.asset(Imagesurls.hats),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      color: Colors.white,
                                      height: 500,
                                      width: 500,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "WOVEN HATS",
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text("SPECIAL DECOR", style: TextStyle(color: Colors.orange),),
                                            const SizedBox(height: 10),
                                            Text(Companydata.description,
                                              style: const TextStyle(fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(height: 10),
                                            Container(
                                              height: 200,
                                              width: 500,
                                              color: Colors.grey[200],
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Row(
                                                      children: [
                                                        Text(
                                                          "90 USD",
                                                          style: TextStyle(
                                                            //decoration: TextDecoration.lineThrough,
                                                              fontSize: 25,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.deepOrange
                                                          ),
                                                        ),
                                                        SizedBox(width: 20),
                                                        Text(
                                                          "120 USD",
                                                          style: TextStyle(
                                                            decoration: TextDecoration.lineThrough,
                                                              fontSize: 14,
                                                              color: Colors.black
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Row(
                                                      children: [
                                                        Icon(Icons.info_outline, size: 20, color: Colors.red,),
                                                        SizedBox(width: 10),
                                                        Text(
                                                            "21 units left",
                                                          style: TextStyle(
                                                            color: Colors.red
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    SmoothStarRating(
                                                        allowHalfRating: true,
                                                        onRatingChanged: (value) {
                                                          rating = value;
                                                          setState(() {
                                                            rating = value;
                                                          });
                                                          //print("Rating is $value stars");
                                                        },
                                                        starCount: 5,
                                                        rating: rating,
                                                        size: 20.0,
                                                        filledIconData: Icons.star,
                                                        halfFilledIconData: Icons.star_half,
                                                        defaultIconData: Icons.star_border,
                                                        color: Colors.amber,
                                                        borderColor: Colors.amber,
                                                        spacing:2.0,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Quantity:",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        const SizedBox(width: 40),
                                                        // Container(
                                                        //   padding: const EdgeInsets.all(4),
                                                        //   decoration: BoxDecoration(
                                                        //       color: Colors.orange[200],
                                                        //       borderRadius: BorderRadius.circular(6)
                                                        //   ),
                                                        //   child: const Icon(Icons.remove),
                                                        // ),
                                                        // const SizedBox(width: 20),
                                                        // Container(
                                                        //   width: 30,
                                                        //   height: 30,
                                                        //   decoration: BoxDecoration(
                                                        //       borderRadius: BorderRadius.circular(6),
                                                        //     border: Border.all(
                                                        //         color: Colors.orange,
                                                        //
                                                        //       width: 2
                                                        //     )
                                                        //   ),
                                                        //   child: Center(child: TextField()),),
                                                        // const SizedBox(width: 20),
                                                        // Container(
                                                        //   padding: const EdgeInsets.all(4),
                                                        //   decoration: BoxDecoration(
                                                        //       color: Colors.orange[200],
                                                        //       borderRadius: BorderRadius.circular(6)
                                                        //   ),
                                                        //   child: const Icon(Icons.add),
                                                        // ),
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 2
                                                              )
                                                          ),
                                                          child: const Icon(Icons.remove),
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 2
                                                              )
                                                          ),
                                                          child: const Center(
                                                            child: TextField(
                                                              textAlign: TextAlign.center,
                                                              textAlignVertical: TextAlignVertical.center,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 2
                                                              )
                                                          ),
                                                          child: const Icon(Icons.add),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Container(
                                                height: 40,
                                                width: 500,
                                                decoration: const BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                                ),
                                                child: const Center(child: Text("ADD TO CART", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
