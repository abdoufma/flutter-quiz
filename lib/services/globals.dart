import 'models.dart';

class Global {
  static final String title = "Kiwi";

  static final Map models = {
    Topic: (data) => Topic.fromMap(data),
    Quiz: (data) => Quiz.fromMap(data),
    Report: (data) => Report.fromMap(data),
  };
}
