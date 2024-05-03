import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jona/controller/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jona/widgets/route.dart';
import 'firebase_options.dart';
import 'dart:js' as js;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((_) {

   // FirebaseLogger.level = LogLevel.error; // Set the desired logging level
  });

  // Override window.console.log
  js.context['console']['log'] = js.allowInterop((dynamic msg) {
    // Check if the log message contains 'firebase'
    if (!msg.toString().contains('firebase')) {
      // Print the log message only if it doesn't contain 'firebase'
      print(msg);
    }
    if (!msg.toString().contains('storage.googleapis.com')) {
      // Print the log message only if it doesn't contain 'storage.googleapis.com'
      print(msg);
    }


  });

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
