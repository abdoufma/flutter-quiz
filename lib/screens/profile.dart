import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/services/auth.dart' show AuthService;
import 'package:kiwi/services/db.dart';
import 'package:kiwi/services/models.dart';
import 'package:provider/provider.dart';

import '../shared/bottomNavBar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    print("USER: ${user.uid}");
    var db = DatabaseService();
    var report = db.getCollection("topics").then(print);
    // .then((value) => print(value.total));
    return Scaffold(
      appBar: AppBar(
          title: Text("${user.displayName}'s profile"),
          backgroundColor: Colors.orange[800]),
      body: Center(
        child: FlatButton(
          child: Text("Logout"),
          onPressed: () async {
            await AuthService().signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/", (route) => false);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(idx: 2),
    );
  }
}
