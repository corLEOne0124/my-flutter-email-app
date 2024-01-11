import 'package:emailapp/widgets/message.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String to = '';
  String subject = '';
  String body = '';
  final key = GlobalKey<FormState>();

  void _saveMessage() {
    final isValid = key.currentState!.validate();

    if (!isValid) {
      return;
    }
    if (isValid) {
      key.currentState!.save();
      Message message = Message(subject, body);
      
      Navigator.pop(context, message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose New Message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    to = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'TO',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Subject must be at least 4 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    subject = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'SUBJECT',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter body';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    body = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'BODY',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 9,
                ),
              ),
              ListTile(
                  title: ElevatedButton(
                child: const Text('SEND'),
                onPressed: () {
                  if (key.currentState == null) {
                    return;
                  }
                  _saveMessage();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
