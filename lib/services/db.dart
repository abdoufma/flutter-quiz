import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'globals.dart';
import 'models.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Quiz> getQuiz(quizId) {
    return _db
        .collection("quizzes")
        .document(quizId)
        .get()
        .then((snap) => Quiz.fromMap(snap.data));
  }

  Future<Topic> getTopic(topicId) {
    return _db
        .collection("topics")
        .document(topicId)
        .get()
        .then((snap) => Topic.fromMap(snap.data));
  }

  Future<Report> getReport() async {
    var user = await AuthService().getUser;
    return _db
        .collection("reports")
        .document(user.uid)
        .get()
        .then((snap) => Report.fromMap(snap.data));
  }

  Future<List> getCollection(path) async {
    var snapshots = await _db.collection(path).getDocuments();
    return snapshots.documents.map((e) => e.data).toList();
  }
}

loadData() async {
  var quiz = await DatabaseService().getQuiz("fortran");
  print(quiz.description);
}

// This is a utility class for getting an instance of a generic Type 'T' without having to define a getter function for it
// So (for ex) instead of defining a new getMyQuiz() function you could just do : Document<Quiz>(path: "quizzes/$quizId");

class Document<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  DocumentReference ref;

  Document({this.path}) {
    ref = _db.document(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }

  Stream<T> getStream() {
    return ref.snapshots().map((v) => Global.models[T](v.data) as T);
  }
}

class Collection<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Collection({this.path}) {
    ref = _db.collection(path);
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.getDocuments();
    return snapshots.documents
        .map((v) => Global.models[T](v.data) as T)
        .toList();
  }

  Stream<List<T>> getStream() {
    return ref.snapshots().map(
        (list) => list.documents.map((doc) => Global.models[T](doc.data) as T));
  }
}
