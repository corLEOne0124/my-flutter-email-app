import 'package:emailapp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:emailapp/screens/message_list.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Important'),
              Tab(text: 'Other'),
            ],
          ),
          title: const Text('Inbox'),
          actions: [
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            MessageList(
              status: 'important',
            ),
            MessageList(
              status: 'other',
            ),
          ],
        ),
      ),
    );
  }
}
