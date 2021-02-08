import 'package:clase3/models/user.dart';
import 'package:clase3/providers/login_provider.dart';
import 'package:clase3/ui/screen/home.dart';
import 'package:clase3/ui/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final User user = Provider.of<LoginProvider>(context).user;

    return Consumer<LoginProvider>(
      builder: (_, LoginProvider loginProvider, __) {
        // return loginProvider.user;
        if (loginProvider.user != null) {
          return Home();
        }
        return SignIn();
      },
    );
  }
}
