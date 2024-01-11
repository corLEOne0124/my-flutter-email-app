import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  const MessageDetail({Key? key, required this.subject, required this.body}) : super(key: key);
  final String subject;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Text(body),
      ),
    );
  }
}
