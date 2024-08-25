import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jona/controller/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jona/widgets/route.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
      ChangeNotifierProvider(child: const MyApp(),
      create: (BuildContext context)=>Ecom())
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Heritage Basket Hub",
      routes: pages,
      initialRoute: Routes.dashboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
