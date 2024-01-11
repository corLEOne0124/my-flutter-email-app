import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:emailapp/models/contact.dart';

class ContactService {
  static final _url = Uri.https('jsonplaceholder.typicode.com', '/users');
  static Future<List<Contact>> browse({query}) async {
    final response = await http.get(_url);
    String content = response.body;
    List collection = json.decode(content);
    Iterable<Contact> _contacts = collection.map((json) => Contact.fromJson(json));
    if (query != null && query.isNotEmpty) {
      _contacts = _contacts.where((contact) => contact.name.toLowerCase().contains(query));
    }

    return _contacts.toList();
  }
}
