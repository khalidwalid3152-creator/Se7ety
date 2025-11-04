import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigations {
  static pushReplacement(BuildContext context,String go, {Object? extra}) {
    context.pushReplacement(go,extra: extra);
  }
    static push(BuildContext context,String go, {Object? extra}) {
    context.push(go,extra: extra);
  }
}
