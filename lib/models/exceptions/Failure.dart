import 'package:food_app_demo/models/exception.dart';

abstract class Failure {
  final String message;
  final String title;

  Failure(this.message, this.title);
}
