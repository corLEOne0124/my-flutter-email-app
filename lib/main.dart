import 'package:emailapp/models/contact_manager.dart';
import 'package:emailapp/providers/provider.dart';
import 'package:emailapp/screens/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, )),
        home:const OtherScreen(),
      ),
    );
  }
}
