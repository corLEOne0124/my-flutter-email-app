import 'package:emailapp/screens/message_detail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:emailapp/widgets/message.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key, this.status = 'important'}) : super(key: key);
  final String status;
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>>? future;
  List<Message> messages = [];
  @override
  void initState() {
    _fetch();

    super.initState();
  }

  void _fetch() async {
    future = Message.browse(status: widget.status);
    messages = await future!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Message>?>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('There was an error ${snapshot.error}');
            }
            messages = snapshot.data as List<Message>;
            return ListView.separated(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];
                return Slidable(
                  key: ObjectKey(message),
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    dismissible: DismissiblePane(onDismissed: () {
                      setState(() {
                        messages.removeAt(index);
                      });
                    }),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            messages.removeAt(index);
                          });
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.

                        onPressed: (context) {},
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: const Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(message.subject),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                      child: const Text('RH'),
                    ),
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MessageDetail(
                              subject: message.subject,
                              body: message.body,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
        }
      },
    );
  }
}
