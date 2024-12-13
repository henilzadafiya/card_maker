import 'package:flutter/material.dart';

import '../widget/icon_widget.dart';

//
// class DesignScreen extends StatefulWidget {
//   const DesignScreen({super.key});
//
//   @override
//   State<DesignScreen> createState() => _DesignScreenState();
// }
//
// class _DesignScreenState extends State<DesignScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Select Languages'),
            trailing: IconWidget(icons: Icons.keyboard_arrow_right_outlined,color: Colors.yellow,),
          ),
          ListTile(
            title: const Text('Feedback'),
            trailing: IconWidget(icons: Icons.keyboard_arrow_right_outlined,color: Colors.yellow,),
          ),
          ListTile(
            title: const Text('Rate Us'),
            trailing: IconWidget(icons: Icons.keyboard_arrow_right_outlined,color: Colors.yellow,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountSettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Share App'),
            trailing: IconWidget(icons: Icons.keyboard_arrow_right_outlined,color: Colors.yellow,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Center(
        child: Text('Account Settings Page'),
      ),
    );
  }
}



class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('About Page'),
      ),
    );
  }
}
