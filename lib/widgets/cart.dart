import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 300.0, right: 300, top: 20),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.lightBlue[50],
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Image.asset("assets/images/chair.png",height: 150,)
                                                    ],
                                                  ),
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          "MacBook Pro",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20
                                                        ),
                                                      ),
                                                      Text(
                                                          "Screen Size | Resolution:16.2 | 3456 x 2234 ; CPU | "
                                                              "GPU:M2 Pro 12-Core | 19-Core GPU ; \n Memory (RAM):32GB ; Storage (SSD):1TB ; "
                                                              "Kit Configuration:Base."
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(
                                                          "In Stock",
                                                        style: TextStyle(
                                                            color: Colors.orange,
                                                            fontSize: 15
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                              "GH₵ 2,345.00",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.delete_outline, color: Colors.orange,),
                                          Text(
                                              "Remove",
                                            style: TextStyle(color: Colors.orange),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.orange[200],
                                                borderRadius: BorderRadius.circular(6)
                                            ),
                                            child: const Icon(Icons.remove),
                                          ),
                                          const SizedBox(width: 20),
                                          const SizedBox(
                                              width: 10,
                                              child: TextField(),),
                                          const SizedBox(width: 20),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.circular(6)
                                            ),
                                            child: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Container(
                                      //       height: 30,
                                      //       width: 30,
                                      //       decoration: const BoxDecoration(
                                      //         color: Colors.white,
                                      //         border: Border(
                                      //             top: BorderSide(color: Colors.black),
                                      //             right: BorderSide(color: Colors.black),
                                      //             left: BorderSide(color: Colors.black),
                                      //             bottom: BorderSide(color: Colors.black))
                                      //       ),
                                      //       child: const Icon(Icons.remove),
                                      //     ),
                                      //     Container(
                                      //       height: 30,
                                      //       width: 30,
                                      //       decoration: const BoxDecoration(
                                      //         color: Colors.white,
                                      //         border: Border(
                                      //             top: BorderSide(color: Colors.black),
                                      //             right: BorderSide(color: Colors.black),
                                      //             bottom: BorderSide(color: Colors.black))
                                      //       ),
                                      //       child: Center(child: const Text("1")),
                                      //     ),
                                      //     Container(
                                      //       height: 30,
                                      //       width: 30,
                                      //       decoration: const BoxDecoration(
                                      //         color: Colors.white,
                                      //         border: Border(
                                      //             top: BorderSide(color: Colors.black),
                                      //             right: BorderSide(color: Colors.black),
                                      //             bottom: BorderSide(color: Colors.black))
                                      //       ),
                                      //       child: const Icon(Icons.add),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            color: Colors.lightGreen[50],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text("Cart Summary"),
                                    ],
                                  ),
                                  const Divider(),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Subtotal",
                                        style: TextStyle(
                                          fontSize: 18
                                        ),
                                      ),
                                      Text(
                                          "GH₵ 2,345.00",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 50),
                                  Container(
                                    height: 40,
                                    color: Colors.orange,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Checkout (GH₵ 2,345.00)",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
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
    );
  }
}
