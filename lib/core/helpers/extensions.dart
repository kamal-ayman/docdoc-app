import 'package:flutter/material.dart';

extension AddStringExt on String {
  int get toInt => int.parse(this);
}

extension Context on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  Future<T?> navigateTo<T extends Object?>(Widget screen, {bool keepAllUntil = true}) {
    if (!keepAllUntil) {
      return Navigator.pushAndRemoveUntil(
          this,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => screen,
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
          (route) => keepAllUntil);
    }
    return Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  void pushReplacement(Widget screen) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  double get getHeight => MediaQuery.of(this).size.height;

  double get getWidth => MediaQuery.of(this).size.width;

  double get getTop => MediaQuery.of(this).padding.top;

  double get getBottom => MediaQuery.of(this).padding.bottom;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension Validator on String {
  bool get isValidEmail {
    return RegExp(r'\S+@\S+\.\S+').hasMatch(this);
  }

  bool get isValidPhoneNumber {
    if (length == 11) {
      return RegExp(r'(010|011|012|015)[0-9]{8}').hasMatch(this);
    }
    return false;
  }

  bool get isValidArName => RegExp(r'^[ا-ي]+\s[ا-ي]+\s[ا-ي]+').hasMatch(this);
}
