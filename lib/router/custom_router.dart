import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/bmiCalculator.dart';


class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {

        return MaterialPageRoute(builder: (_) =>bmi());

  }
}
