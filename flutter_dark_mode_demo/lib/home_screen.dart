import 'package:flutter/material.dart';
import 'package:flutter_dark_mode_demo/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dark Mode"),
      ),
      body: Selector<Themeprovider, ThemeMode>(
        selector: (_, model) => model.themeMode,
        builder: (_, themeMode, __) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  context.read<Themeprovider>().themeMode = ThemeMode.dark;
                },
                title: Text("On"),
                trailing:
                    themeMode == ThemeMode.dark ? Icon(Icons.check) : null,
              ),
              ListTile(
                onTap: () {
                  context.read<Themeprovider>().themeMode = ThemeMode.light;
                },
                title: Text("Off"),
                trailing:
                    themeMode == ThemeMode.light ? Icon(Icons.check) : null,
              ),
              ListTile(
                onTap: () {
                  context.read<Themeprovider>().themeMode = ThemeMode.system;
                },
                title: Text("System"),
                trailing:
                    themeMode == ThemeMode.system ? Icon(Icons.check) : null,
              ),
              Text(
                "Hola Soy un ejemplo",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Action"),
      ),
    );
  }
}
