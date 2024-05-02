import 'package:flutter/material.dart';

import '../constanst.dart';


class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.grey[500],
                            child: Image.asset("assets/images/chair.png"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.grey[500],
                            child: Image.asset("assets/images/chair.png"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.grey[500],
                            child: Image.asset("assets/images/chair.png"),
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        Container(
                          color: Colors.lightBlue[50],
                          height: 500,
                          width: 500,
                          child: Image.asset(Imagesurls.hats),
                        ),
                        Container(
                          color: Colors.white,
                          height: 500,
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                    "WOVEN HATS",
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 10),
                                Text(Companydata.description,
                                  style: const TextStyle(fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 200,
                                  width: 500,
                                  color: Colors.grey[200],
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "90 USD",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrange
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                // Row(
                                //   children: [
                                //     const Text(
                                //         "Quantity:",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold
                                //       ),
                                //     ),
                                //     const SizedBox(width: 40),
                                //     Container(
                                //       padding: const EdgeInsets.all(4),
                                //       decoration: BoxDecoration(
                                //           color: Colors.orange[200],
                                //           borderRadius: BorderRadius.circular(6)
                                //       ),
                                //       child: const Icon(Icons.remove),
                                //     ),
                                //     const SizedBox(width: 20),
                                //     const SizedBox(
                                //       width: 10,
                                //       child: TextField(),),
                                //     const SizedBox(width: 20),
                                //     Container(
                                //       padding: const EdgeInsets.all(4),
                                //       decoration: BoxDecoration(
                                //           color: Colors.orange[200],
                                //           borderRadius: BorderRadius.circular(6)
                                //       ),
                                //       child: const Icon(Icons.add),
                                //     ),
                                //   ],
                                // ),
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
                      ],
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
