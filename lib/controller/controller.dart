import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/menu_type.dart';
import 'dbfields.dart';
class Ecom extends ChangeNotifier{
   final db=FirebaseFirestore.instance;
   final auth=FirebaseAuth.instance;
   String companyname="";
   String companyemail="";
   String companyphone="";
   String companyaddress="";
   
  bool accountcreated=false;
  String error="";
  bool cardstatus=false;
  String cartidnumber="";
  bool loginstatus=false;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // Add other scopes as needed.
    ],
  );


  
  companyinfo()async{
try{
  final dbcompanyinfo=await db.collection("settings").get();
  companyname=dbcompanyinfo.docs[0]['name'];
  companyemail=dbcompanyinfo.docs[0]['email'];
  companyphone=dbcompanyinfo.docs[0]['phone'];
  companyaddress=dbcompanyinfo.docs[0]['address'];
}on FirebaseException catch(e){
  print(e.message);
}

    notifyListeners();
  }
  itemslist()async{
    await db.collection('useitemrs').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
      //  print(doc["item"]);
      });
    });

}


  signupwithemail(String firstname,String lastname,String username,String contact,String sex,String email,String password)async{
    try{
      await Dbfields.auth.createUserWithEmailAndPassword(email: email, password: password);
      final countexiist=await Dbfields.db.collection(Dbfields.users).get();
      int userid=countexiist.docs.length+1;
      final data={
        Dbfields.firstname:firstname,
        Dbfields.lastname:lastname,
        Dbfields.username:username,
        Dbfields.contact:contact,
        Dbfields.sex:sex,
        Dbfields.email:email,
        Dbfields.password:password,
        Dbfields.userid:userid
      };
      await Dbfields.db.collection(Dbfields.users).doc(email).set(data);
      if(Dbfields.auth.currentUser!=null && !Dbfields.auth.currentUser!.emailVerified)
        {
          Dbfields.auth.currentUser!.sendEmailVerification();
        }
      accountcreated=true;
      error="";
    }on FirebaseException catch (e){
      accountcreated=false;
      error=e.message!;
    }
    notifyListeners();

  }

   String capitalizeEachWord(String input) {
     // Split the input string into words
     List<String> words = input.split(' ');

     // Capitalize the first letter of each word
     List<String> capitalizedWords = words.map((word) {
       // Handle cases where the word is empty
       if (word.isEmpty) {
         return word;
       }
       // Capitalize the first letter and concatenate the rest of the word
       return word[0].toUpperCase() + word.substring(1);
     }).toList();

     // Join the capitalized words back into a single string
     return capitalizedWords.join(' ');
   }

  loginwithemail(String email,String password) async{
    try{
        final mylogin= await Dbfields.auth.signInWithEmailAndPassword(email: email, password: password);
        if(!Dbfields.auth.currentUser!.emailVerified)
          {
            Dbfields.auth.currentUser!.sendEmailVerification();
            error="Please verify your email to continue to add to cart";
          }
       // print(Dbfields.auth.currentUser!.emailVerified);
       // addtocart(email, "0553354349", "TV","code", "200", "20");
        String? myemail=Dbfields.auth.currentUser!.email;
        //cartid("id", "date", false, "method", myemail!);
    }on FirebaseException catch(e){
      error=e.message!;
     // print(error);

    }

    notifyListeners();
  }

  Future<bool> addtocart(String itemname,String price,String quantity,String code)async{
  //  double total=double.parse(price)*double.parse(quantity);
    bool success=false;
    if(Dbfields.auth.currentUser==null) {
      success=false;
      cardstatus=false;
      print("Please u are not login");
      error="Please you must login before you can add to cart";

    }
    else if(!Dbfields.auth.currentUser!.emailVerified){
      success=false;
      cardstatus=false;
      error="Your email is not verified. Check your inbox and verify your email";
      print("You are not verified");
    }
    else
      {
        String? email=Dbfields.auth.currentUser!.email;
        String? contact=Dbfields.auth.currentUser!.phoneNumber;
        final date=DateTime.now();
        String mycartid=await cartid("id", "$date", false, "MOMO", email!);
        final data={
          Dbfields.email:email,
          Dbfields.contact:contact,
          Dbfields.itemname:itemname,
          Dbfields.price:price,
          Dbfields.quantity:quantity,
          Dbfields.code:code,
          Dbfields.cartidnumber:mycartid,
        };
        await Dbfields.db.collection(Dbfields.cart).add(data);
        cartidnumber=mycartid;
        success=true;
        print("Added Successfully$cartidnumber");
      }
    notifyListeners();

    return success;

  }

  Future<String> cartid(String id,String date,bool status,String method,String email)async{
    String cid="NO";
      if(Dbfields.auth.currentUser!.emailVerified){
        final data ={
          Dbfields.date:date,
          Dbfields.cartstatus:status,
          Dbfields.paymentmethod:method,
          Dbfields.email:email,
        };
        //check if the person has cartid that is not paid for;
        final cartidcount=await Dbfields.db.collection(Dbfields.cartids).get();
        final mycartid=await Dbfields.db.collection(Dbfields.cartids).where(Dbfields.cartstatus, isEqualTo: false).where(Dbfields.email, isEqualTo: email).get();
        print(mycartid.docs.length);
        if(mycartid.docs.isEmpty)
          {
            int realcartid=cartidcount.docs.length+1;
            await Dbfields.db.collection(Dbfields.cartids).doc("$realcartid").set(data);
            cid="$realcartid";
            print("New Cart ID Added");
            cartidnumber=cid;
          }
        else
          {
            cid=mycartid.docs[0].id;
            cartidnumber=cid;
            print("Already have unpaid Cart ID");
          }



      }
      notifyListeners();
      return cid;
  }

  Future<void> signInWithGoogle() async {
    // Create a new provider
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({
        'login_hint': 'user@example.com'
      });
      // Once signed in, return the UserCredential
      final my_login = await Dbfields.auth.signInWithPopup(googleProvider);
      //print(my_login);
    }on FirebaseException catch(e){
     // print(e);
      //errorMsgs=e.message!;
    }
    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
  googlesignup(BuildContext context) async{
    final GoogleSignInAccount? googleSignInAccount=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount!.authentication;
    final credentials=GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken);
    try{
      await  Dbfields.auth.signInWithCredential(credentials);
      loginstatus=true;
      String? name=Dbfields.auth.currentUser!.displayName;
      String? email=Dbfields.auth.currentUser!.email;
      // final existdata=await Dbfields.db.collection("users").doc(email).get();
      // if(existdata.exists)
      // {
      //   String phone=existdata.data()!['phone'];
      //   await setsession(name!, email!, phone);
      //   if(await SessionManager().containsKey("pin"))
      //   {
      //     Navigator.pushNamed(context, Routes.pinscreen);
      //
      //   }
      //   else
      //   {
      //     Navigator.pushNamed(context, Routes.pinsetup);
      //
      //   }
      // }
      // else
      // {
      //   googlebtn=true;
      //   await SessionManager().set("googlebtn", true);
      //   Navigator.pushNamed(context, Routes.signup);
      // }


      // setsession(name!, email!);
      notifyListeners();
    }on FirebaseException catch(e){
      print( e.message!);

    }
    notifyListeners();
  }

  Future<User?> signInWithGoogles({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
   // if (googleSignInAccount != null)
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        if (googleSignInAccount != null){
          final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          final UserCredential userCredential =await auth.signInWithCredential(credential);
//print(userCredential);
          user = userCredential.user;
          }

      } on FirebaseAuthException catch (e) {
        loginstatus=false;
        error=e.message!;
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        print(e);
        // handle the error here
      }


    return user;
  }


  Future<void> silentSignIn() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signInSilently();
      if (account != null) {
        // Successfully signed in silently
        print('Successfully signed in silently, user: ${account.email}');
        // Proceed with your application logic here (e.g., navigate to home screen)
      } else {
        // User could not be signed in silently
        print('User could not be signed in silently');
        // You may want to prompt the user to sign in interactively
      }
    } catch (error) {
      print('Error signing in silently: $error');
      // Handle the error (e.g., by showing an error message or prompting an interactive sign-in)
    }
  }


}