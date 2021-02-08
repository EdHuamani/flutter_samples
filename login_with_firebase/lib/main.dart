import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/login_provider.dart';
import 'ui/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
