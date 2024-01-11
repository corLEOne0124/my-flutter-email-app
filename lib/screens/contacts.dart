import 'package:emailapp/models/contact_search_delegate.dart';
import 'package:emailapp/widgets/contact_counter.dart';
import 'package:emailapp/widgets/contact_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:emailapp/widgets/drawer.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);
  // final ContactManager manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          const ContactCounter(),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: ContactSearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
          )
        ],
      ),
      body: ContactListBuilder(
        builder: (context, contacts) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(),
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].email),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: contacts.length);
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
