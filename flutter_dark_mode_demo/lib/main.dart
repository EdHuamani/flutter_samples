import 'package:flutter/material.dart';
import 'package:flutter_dark_mode_demo/home_screen.dart';
import 'package:flutter_dark_mode_demo/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Themeprovider(),
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // //
    // Consumer<Themeprovider>(
    //   builder: (_, Themeprovider model, __) {
    //     if (model.isLoading)
    //       return SizedBox(
    //         height: 2,
    //         child: LinearProgressIndicator(),
    //       );
    //     return Text(model.data.toString());
    //   },
    // );
    // //
    // Selector<Themeprovider, Tuple2<bool, List<String>>>(
    //   selector: (_, model) => Tuple2(model.isLoading, model.data),
    //   builder: (_, Tuple2<bool, List<String>> data, __) {
    //     if (data.item1)
    //       return SizedBox(
    //         height: 2,
    //         child: LinearProgressIndicator(),
    //       );
    //     return Text(data.item2.toString());
    //   },
    // );

    // return Selector<Themeprovider, ThemeMode>(
    //   selector: (_, Themeprovider model) => model.themeMode,
    //   builder: (_, ThemeMode themeMode, __) {
    //     return MaterialApp(
    //       title: 'Flutter Dark Mode Demo',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //         visualDensity: VisualDensity.adaptivePlatformDensity,
    //       ),
    //       themeMode: themeMode,
    //       darkTheme: ThemeData(
    //         brightness: Brightness.dark,
    //         primarySwatch: Colors.orange,
    //       ),
    //       home: HomeScreen(),
    //     );
    //   },
    // );

    return MaterialApp(
      title: 'Flutter Dark Mode Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // canvasColor: Colors.grey,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      themeMode: context.select((Themeprovider model) => model.themeMode),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        // canvasColor: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
