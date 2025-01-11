import 'package:flutter/material.dart';
import 'package:youtube_video_player/pages/contact_page.dart';
import 'package:youtube_video_player/pages/math_page.dart';
import 'package:youtube_video_player/pages/video_page.dart';
import 'package:youtube_video_player/services/auth/auth_service.dart';

import 'package:youtube_video_player/pages/settings_page.dart';

import 'package:youtube_video_player/view/main_tabview/main_tabview.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.primary,

                size: 64,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
          ),
         ),
         Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                )
               );
              },
          ),
         ),
         Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("C A L C U L A T O R"),
              leading: const Icon(Icons.calculate),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => MathPage(),
                )
               );
              },
          ),
         ),
         Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("F O O D"),
              leading: const Icon(Icons.calculate),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => MainTabView(),
                )
               );
              },
          ),
         ),
         Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("C O N T A C T "),
              leading: const Icon(Icons.contacts),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ContactPage(),
                )
               );
              },
          ),
         ),
         Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("Y O U T U B E"),
              leading: const Icon(Icons.movie),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => VideoPage(),
                )
               );
              },
          ),
         ),
         
        ],
      ),
         Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
          ),
         ),
        ]
      )
    );
  }
}