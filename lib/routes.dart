import 'package:easycut/core/constant/routes.dart';
import 'package:easycut/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => Login(),
};
