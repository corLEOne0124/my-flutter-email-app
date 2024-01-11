import 'package:emailapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        
      ),
      drawer:const AppDrawer(),
      body: Container(),
    );
  }
}
