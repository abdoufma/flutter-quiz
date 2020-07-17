import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class AuthService {
  // AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get getUser => _auth.currentUser();

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<FirebaseUser> anonLogin() async {
    FirebaseUser user = (await _auth.signInAnonymously()).user;
    updateUserData(user);
    return user;
  }

  Future<FirebaseUser> googleSignIn() async {
    print("-----------------------Trying to login-----------------------");
    try {
      GoogleSignInAccount account = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print("--------logged in as ${user.email}---------");
      print("UID: ${user.uid}");
      updateUserData(user);
      return user;
    } catch (e) {
      print("----WHOOOOOOPS----\n $e");
      return null;
    }
  }

  Future<void> updateUserData(FirebaseUser user) {
    var ref = _db.collection("reports").document(user.uid);
    ref.setData({'uid': user.uid, 'lastActivity': DateTime.now()}, merge: true);
  }

  Future<void> signOut() => _auth.signOut();
}
