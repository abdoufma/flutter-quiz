import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiwi/screens/about.dart';
import 'package:kiwi/services/auth.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';
import 'screens/profile.dart';
import 'screens/topics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<FirebaseUser>.value(value: AuthService().user),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
          ],
          routes: {
            '/': (context) => TopicsScreen(),
            '/topics': (context) => TopicsScreen(),
            '/profile': (context) => ProfileScreen(),
            '/about': (context) => AboutScreen()
          },
          theme: ThemeData(fontFamily: "Nunito", brightness: Brightness.dark),
        ));
  }
}
