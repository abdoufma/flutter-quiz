import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String pic;

  UserCard({@required this.name, @required this.pic});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      margin: EdgeInsets.all(8),
      shadowColor: Color.fromARGB(80, 0, 0, 0),
      child: Column(
        children: [
          Image.network(pic),
          Text(name, style: TextStyle(fontSize: 40))
        ],
      ),
    );
  }
}

class MyAvatar extends StatelessWidget {
  MyAvatar({@required this.img, this.width = 50, this.borderWidth = 4});

  final ImageProvider img;
  final double width;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width + borderWidth,
      backgroundColor: Color(0xffFDCF09),
      child: CircleAvatar(
        radius: width,
        backgroundImage: img,
      ),
    );
  }
}

// working on provider

// class User {
//   final String name;
//   User(this.name);
// }

// Future<User> getUser() async {
//   var a = await Firestore.instance.collection("users").document("john").get();
//   if (a != null) {
//     print(a.data);
//     return User(a.data["name"]);
//   }
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     var user = getUser();
//     return StreamProvider<User>.value(
//         value: user,
//         builder: (context, snapshot) {
//           return MaterialApp(home:HomePage());
//         });
//   }
// }

// // somewhere down the tree....

// var passed_data = Provider.of<DocumentSnapshot>(context);

// Streambuilder

// StreamBuilder userFromSB(stream) {
//   return StreamBuilder<DocumentSnapshot>(
//     stream: stream,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         Map user = snapshot.data.data;
//         return UserCard(name: user["name"], pic: user["pic"]);
//       } else {
//         return Text('No data found.');
//       }
//     },
//   );
// }
