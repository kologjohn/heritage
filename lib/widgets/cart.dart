import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jona/components/global.dart';

import '../constanst.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 1500,
                      color: Colors.white70,
                      //height: 1500,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      runAlignment: WrapAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            //color: Colors.lightBlue[50],
                                            //height: 300,
                                            width: 800,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Image.asset(Imagesurls.d2,height: 200,)
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      const Text(
                                                                        "U-Shopper Basket",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      Container(
                                                                        width: 500,
                                                                        child: const Text(
                                                                            "Screen Size | Resolution:16.2 |3456 x 2234 ; CPU | "
                                                                                "GPU:M2 Pro 12-Core | 19-Core GPU;"
                                                                                "Memory (RAM):32GB ; Storage "
                                                                                "(SSD):1TB Kit Configuration:Base.",
                                                                          style: TextStyle(
                                                                              fontSize: 15
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      const Text(
                                                                        "USD 245.00",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 15),
                                                                      const Text(
                                                                        "In Stock",
                                                                        style: TextStyle(
                                                                            color: Global.mainColor,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Row(
                                                                            children: [
                                                                              Icon(Icons.delete_outline, color: Global.mainColor,),
                                                                              Text(
                                                                                "Remove",
                                                                                style: TextStyle(color: Global.mainColor,),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 30),
                                                                          QuantityTableCell(),
                                                                          // Row(
                                                                          //   children: [
                                                                          //     Container(
                                                                          //       padding: const EdgeInsets.all(4),
                                                                          //       decoration: BoxDecoration(
                                                                          //           color: Global.mainColor,
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
                                                                          //           color: Global.mainColor,
                                                                          //           borderRadius: BorderRadius.circular(6)
                                                                          //       ),
                                                                          //       child: const Icon(Icons.add),
                                                                          //     ),
                                                                          //   ],
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row(
                                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Image.asset(Imagesurls.d2,height: 200,)
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      const Text(
                                                                        "U-Shopper Basket",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      Container(
                                                                        width: 400,
                                                                        child: const Text(
                                                                            "Screen Size | Resolution:16.2 |3456 x 2234 ; CPU | "
                                                                                "GPU:M2 Pro 12-Core | 19-Core GPU;"
                                                                                "Memory (RAM):32GB ; Storage "
                                                                                "(SSD):1TB Kit Configuration:Base."
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      const Text(
                                                                        "USD 245.00",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 15),
                                                                      const Text(
                                                                        "In Stock",
                                                                        style: TextStyle(
                                                                            color: Global.mainColor,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Row(
                                                                            children: [
                                                                              Icon(Icons.delete_outline, color: Global.mainColor,),
                                                                              Text(
                                                                                "Remove",
                                                                                style: TextStyle(color: Global.mainColor,),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 30),
                                                                          QuantityTableCell(),
                                                                          // Row(
                                                                          //   children: [
                                                                          //     Container(
                                                                          //       padding: const EdgeInsets.all(4),
                                                                          //       decoration: BoxDecoration(
                                                                          //           color: Global.mainColor,
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
                                                                          //           color: Global.mainColor,
                                                                          //           borderRadius: BorderRadius.circular(6)
                                                                          //       ),
                                                                          //       child: const Icon(Icons.add),
                                                                          //     ),
                                                                          //   ],
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row(
                                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Image.asset(Imagesurls.d2,height: 200,)
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      const Text(
                                                                        "U-Shopper Basket",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      Container(
                                                                        width: 400,
                                                                        child: const Text(
                                                                            "Screen Size | Resolution:16.2 |3456 x 2234 ; CPU | "
                                                                                "GPU:M2 Pro 12-Core | 19-Core GPU;"
                                                                                "Memory (RAM):32GB ; Storage "
                                                                                "(SSD):1TB Kit Configuration:Base."
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      const Text(
                                                                        "USD 245.00",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 15),
                                                                      const Text(
                                                                        "In Stock",
                                                                        style: TextStyle(
                                                                            color: Global.mainColor,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Row(
                                                                            children: [
                                                                              Icon(Icons.delete_outline, color: Global.mainColor,),
                                                                              Text(
                                                                                "Remove",
                                                                                style: TextStyle(color: Global.mainColor,),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 30),
                                                                          QuantityTableCell(),
                                                                          // Row(
                                                                          //   children: [
                                                                          //     Container(
                                                                          //       padding: const EdgeInsets.all(4),
                                                                          //       decoration: BoxDecoration(
                                                                          //           color: Global.mainColor,
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
                                                                          //           color: Global.mainColor,
                                                                          //           borderRadius: BorderRadius.circular(6)
                                                                          //       ),
                                                                          //       child: const Icon(Icons.add),
                                                                          //     ),
                                                                          //   ],
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row(
                                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Image.asset(Imagesurls.d2,height: 200,)
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      const Text(
                                                                        "U-Shopper Basket",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      Container(
                                                                        width: 400,
                                                                        child: const Text(
                                                                            "Screen Size | Resolution:16.2 |3456 x 2234 ; CPU | "
                                                                                "GPU:M2 Pro 12-Core | 19-Core GPU;"
                                                                                "Memory (RAM):32GB ; Storage "
                                                                                "(SSD):1TB Kit Configuration:Base."
                                                                        ),
                                                                      ),
                                                                      const SizedBox(height: 15),
                                                                      const Text(
                                                                        "USD 245.00",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 15),
                                                                      const Text(
                                                                        "In Stock",
                                                                        style: TextStyle(
                                                                            color: Global.mainColor,
                                                                            fontSize: 15
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Row(
                                                                            children: [
                                                                              Icon(Icons.delete_outline, color: Global.mainColor,),
                                                                              Text(
                                                                                "Remove",
                                                                                style: TextStyle(color: Global.mainColor,),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 30),
                                                                          QuantityTableCell(),
                                                                          // Row(
                                                                          //   children: [
                                                                          //     Container(
                                                                          //       padding: const EdgeInsets.all(4),
                                                                          //       decoration: BoxDecoration(
                                                                          //           color: Global.mainColor,
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
                                                                          //           color: Global.mainColor,
                                                                          //           borderRadius: BorderRadius.circular(6)
                                                                          //       ),
                                                                          //       child: const Icon(Icons.add),
                                                                          //     ),
                                                                          //   ],
                                                                          // ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            //height: 300,
                                            width: 500,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Text(
                                                          "Cart Summary",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(),
                                                  const Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Subtotal",
                                                        style: TextStyle(
                                                            fontSize: 15
                                                        ),
                                                      ),
                                                      Text(
                                                        "USD 245.00",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 50),
                                                  Container(
                                                    height: 40,
                                                    color: Global.mainColor,
                                                    child: const Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "Checkout (USD 245.00)",
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
                                        ),
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

class QuantityTableCell extends StatefulWidget {
  @override
  _QuantityTableCellState createState() => _QuantityTableCellState();
}

class _QuantityTableCellState extends State<QuantityTableCell> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _decrementQuantity,
            ),
            Text('$_quantity'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _incrementQuantity,
            ),
          ],
        ),
      ),
    );
  }
}