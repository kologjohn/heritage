import 'package:flutter/material.dart';
import 'package:jona/components/forgot_password.dart';
import 'package:jona/components/forgot_screen.dart';
import 'package:jona/components/social_button.dart';
import 'package:jona/controller/controller.dart';
import 'package:xen_popup_card/xen_popup_card.dart';

import '../components/global.dart';
import '../components/gradient_button.dart';
import '../components/login_field.dart';


Future itemupload(BuildContext context) {

  XenCardGutter gutter = XenCardGutter(
    child: InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        color: Colors.black45,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("close", textAlign: TextAlign.center),
        ),
      ),
    ),
  );

 final formvalidate=GlobalKey<FormState>();
 bool formval(){
   return formvalidate.currentState!.validate();
 }
  TextEditingController item_controller=TextEditingController();
  TextEditingController barcode_controller=TextEditingController();
  TextEditingController price_controller=TextEditingController();
  TextEditingController des_controller=TextEditingController();
  TextEditingController quantity_controller=TextEditingController();


  return showDialog(
    context: context,
    builder: (builder) => SizedBox(
      height: 100,
      width: 80,
      child: XenPopupCard(
        //cardBgColor: Colors.black,
        gutter: gutter,
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Form(
                key: formvalidate,
                child: ListView(
                  children: [
                    // Existing form fields
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Upload Items.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    LoginField(hintText: 'Item Name',controller: item_controller,textInputType: TextInputType.name,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Input/Scan Barcode',controller: item_controller,textInputType: TextInputType.text,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Price',controller: price_controller,textInputType: const TextInputType.numberWithOptions(decimal: true),),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Quantity',controller: quantity_controller,textInputType: const TextInputType.numberWithOptions(decimal:true ),),
                    const SizedBox(height: 15,),
                    const SizedBox(height: 15,),    LoginField(hintText: 'Description',controller: des_controller,textInputType: const TextInputType.numberWithOptions(decimal:true ),),

                    const SizedBox(height: 20,),
                     Container(
                      decoration: BoxDecoration(
                          color: Global.borderColor,
                          // gradient: const LinearGradient(
                          //     colors: [
                          //       Global.gradient1,
                          //       Global.gradient2,
                          //       Global.gradient3,
                          //     ],
                          //   begin: Alignment.bottomLeft,
                          //   end: Alignment.topRight,
                          // ),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          formval();
                          String item=item_controller.text.trim();
                          String price=price_controller.text.trim();
                          String quantity=quantity_controller.text.trim();
                          String description=des_controller.text.trim();
                          String barcode=barcode_controller.text.trim();
                         // Ecom().signupwithemail(firstnname_txt, lastname_txt, username_txt, contact_txt, sex, email_txt, password_txt);
                         // print(Ecom().accountcreated);
                        //  print(Ecom().error);

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(395, 55),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Save Product',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    //const SizedBox(height: 20,),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        InkWell(
                          child: GestureDetector(
                            onTap: (){},
                            child: const Text(
                              ' Sign In',
                              style: TextStyle(
                                color: Global.gradient3,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
