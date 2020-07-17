import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/shared/MyDrawer.dart';
import 'package:kiwi/shared/bottomNavBar.dart';
import 'package:provider/provider.dart';

import '../shared/misc.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Topics")),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          TopicCard(),
          TopicCard(),
          TopicCard(),
          TopicCard(),
          TopicCard(),
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavBar(idx: 0),
    );
  }
}

class TopicCard extends StatelessWidget {
  const TopicCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("WIDTH: ${size.width}");
    print("Height:${size.height}");
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/angular.png"),
          Text(
            "Hello",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
