import 'package:flutter/material.dart';
import 'package:tezda_ecom/domain/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: GetNamedRoutes.getRoutes(),
      initialRoute: RoutePath.mainScreen,
    );
  }
}
