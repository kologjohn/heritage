import 'package:flutter/material.dart';
import 'package:jona/components/forgot_password.dart';
import 'package:jona/components/forgot_screen.dart';
import 'package:jona/components/social_button.dart';
import 'package:jona/controller/controller.dart';
import 'package:xen_popup_card/xen_popup_card.dart';

import '../components/global.dart';
import '../components/gradient_button.dart';
import '../components/login_field.dart';


Future signup(BuildContext context) {

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
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController contact=TextEditingController();


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
                        Text('Sign Up.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    LoginField(hintText: 'First Name',controller: firstname,textInputType: TextInputType.name,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Last Name',controller: lastname,textInputType: TextInputType.name,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'User Name',controller: username,textInputType: TextInputType.name,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Email',controller: email,textInputType: TextInputType.emailAddress,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Phone',controller: contact,textInputType: TextInputType.phone,),
                    const SizedBox(height: 15,),
                    LoginField(hintText: 'Password',controller: password,textInputType: TextInputType.visiblePassword,),
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
                          String email_txt=email.text.trim();
                          String password_txt=password.text.trim();
                          String firstnname_txt=firstname.text.trim();
                          String lastname_txt=lastname.text.trim();
                          String username_txt=username.text.trim();
                          String contact_txt=contact.text.trim();
                          String sex="Male";
                          Ecom().signupwithemail(firstnname_txt, lastname_txt, username_txt, contact_txt, sex, email_txt, password_txt);
                          print(Ecom().accountcreated);
                          print(Ecom().error);

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(395, 55),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Create Account',
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
