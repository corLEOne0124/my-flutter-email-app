import 'dart:async';

import 'package:emailapp/models/contact.dart';
import 'package:emailapp/services/contact_service.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  Stream<List<Contact>> get contactListView {
    return Stream.fromFuture(ContactService.browse());
  }
Stream<List<Contact>> filtereCollection({query}) {
    return Stream.fromFuture(ContactService.browse(query:query));
  }
  final StreamController<int> _contactController = BehaviorSubject<int>();
  Stream<int> get contactCounter => _contactController.stream;

  ContactManager() {
    contactListView.listen((list) {
      _contactController.add(list.length);
    });
  }
}
