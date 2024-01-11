import 'package:emailapp/models/contact.dart';
import 'package:flutter/material.dart';

import '../models/contact_manager.dart';
import '../providers/provider.dart';

class ContactListBuilder extends StatelessWidget {
  const ContactListBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final Function builder;
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);
    return StreamBuilder<List<Contact>>(
      stream: manager.contactListView,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data!;
            return builder(context, contacts);
        }
      },
    );
  }
}
