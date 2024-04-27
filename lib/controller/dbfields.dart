import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Dbfields{
  static final db=FirebaseFirestore.instance;
  static final auth=FirebaseAuth.instance;
  //database routes
  static String users="users";
  static String products="products";
  static String cart="cart";
  static String cartids="cartids";

  //database Fields
  static String firstname="firstname";
  static String lastname="lastname";
  static String username="username";
  static String sex="sex";
  static String contact="contact";
  static String email="email";
  static String password="password";
  static String userid="userid";

  //Database Cart Fields
  static  String itemname="name";
  static  String code="code";
  static  String price="price";
  static  String quantity="quantity";
  static  String total="total";
  //Databse Cartid
  static String date="date";
  static String cartstatus="status";
  static String paymentmethod="method";
  static String cartidnumber="cartidnumber";
}

class ItemReg{
  static String item="item";
  static String itemurl="itemurl";
  static String description="description";
  static String sellingprice="sellingprice";
  static String costprice="costprice";
  static String wholesaleprice="wholesaleprice";
  static String quantity="quantity";
  static String code="code";
  static String date="date";
  static  String staff="staff";
  static  String category="category";
  static  String companyemail="companyemail";
  static  String companycode="companycode";
}