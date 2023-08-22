import 'package:easycut/core/services/services.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const EasyCut());
}
