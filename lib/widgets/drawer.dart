import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer( child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Ruslan'),
              accountEmail: const Text('haciyevruslan2005@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbT7ev8CHDXFMCdtgXu8nDj9VP0iuJ4CQjog&usqp=CAU'),
              ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Adding New Account'),
                          );
                        });
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text('Inbox'),
              trailing: Chip(
                label: Text(
                  '11',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.penToSquare),
              title: Text('Draft'),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.boxArchive),
              title: Text('Archive'),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text('Sent'),
            ),
            const ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text('Trash'),
            ),
            const Divider(),
            const Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(FontAwesomeIcons.gear),
              ),
            ))
          ],
        ),
      );
  }
}