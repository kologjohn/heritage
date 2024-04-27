import 'package:flutter/material.dart';

import 'global.dart';


class LoginField extends StatelessWidget {
  final String hintText;
  final  TextEditingController controller;
  final TextInputType textInputType;
  const LoginField({super.key, required this.hintText,required this.controller, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Global.borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
