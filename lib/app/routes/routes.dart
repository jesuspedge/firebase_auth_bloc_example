import 'package:flutter/widgets.dart';
import 'package:firebase_bloc_login_example/app/app_exports.dart';
import 'package:firebase_bloc_login_example/login/login_exports.dart';
import 'package:firebase_bloc_login_example/home/home_exports.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
