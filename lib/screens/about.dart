import 'package:flutter/material.dart';
import 'package:kiwi/shared/bottomNavBar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(
        child: FlatButton(
            onPressed: () {
              AboutDialog(
                applicationName: "Kiwi",
                applicationLegalese: "Lorem Ipsum Dolore...",
              );
            },
            child: Text('About us')),
      ),
      bottomNavigationBar: BottomNavBar(idx: 1),
    );
  }
}
