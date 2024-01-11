import 'package:emailapp/widgets/contact_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:emailapp/models/contact_manager.dart';

import '../providers/provider.dart';

class ContactSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // ContactManager manager = Provider.of<ContactManager>(context);
    if (query.length < 3) {
      return const Center(
        child: Text('Type at least 3 letters to search'),
      );
    }
    return ContactListBuilder(
   
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
