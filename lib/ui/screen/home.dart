import 'package:clase3/models/user.dart';
import 'package:clase3/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obteniento usuario
    final User user = Provider.of<LoginProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.all_out),
            onPressed: () =>
                Provider.of<LoginProvider>(context, listen: false).signOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user.photoUrl != null)
              CircleAvatar(
                child: Image.network(user.photoUrl),
              ),
              
            Text("Welcome ${user.displayName}"),
            Text("Email: ${user.email}"),
          ],
        ),
      ),
    );
  }
}
