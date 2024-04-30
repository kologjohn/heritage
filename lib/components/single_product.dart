import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.red,
                  )
              ),
              Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.green,
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
