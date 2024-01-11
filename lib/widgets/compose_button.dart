// ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';

// import 'package:emailapp/widgets/message.dart';

// class ComposeButton extends StatelessWidget {
//   const ComposeButton({Key? key, required this.messages}) : super(key: key);
//   final List<Message> messages;
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       child: const Icon(Icons.add),
//       onPressed: () async {
//         Message message = await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return const NewMessage();
//             },
//           ),
//         );

//         messages.add(message);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Message has been sent'),
//           ),
//         );
        
//       },
//     );
//   }
// }
