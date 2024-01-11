import 'package:flutter/material.dart';

import '../models/contact_manager.dart';
import '../providers/provider.dart';


class ContactCounter extends StatelessWidget {
  const ContactCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);
    return StreamBuilder<int?>(
        stream: manager.contactCounter,
        builder: (context, snapshot) {
          return Chip(
            label: Text(
              (snapshot.data ?? 0).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.amber,
          );
        });
  }
}
