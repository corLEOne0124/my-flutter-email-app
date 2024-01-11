import 'package:emailapp/screens/calendar.dart';
import 'package:emailapp/screens/contacts.dart';
import 'package:emailapp/screens/inbox.dart';
import 'package:flutter/material.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  int _selectedIndex = 0;
  void _onBarItemTab(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const InboxScreen(),
        ContactsScreen(),
        const CalendarScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Inbox',
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: 'Contacts',
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: 'Calendar',
            icon: Icon(Icons.calendar_today),
          ),
        ],
        onTap: _onBarItemTab,
      ),
    );
  }
}
  

  


 
      //   floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () async {
      //     Message message = await Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return const NewMessage();
      //         },
      //       ),
      //     );

      //     setState(() {
      //       messages.add(message);
      //     });
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text('Message has been sent'),
      //       ),
      //     );
      //   },
      // ),

      // drawer: const AppDrawer(),