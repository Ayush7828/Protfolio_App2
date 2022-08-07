import 'package:flutter/material.dart';
import 'package:protfolio/pages/about_page.dart';
import 'package:protfolio/pages/project_page.dart';
import 'package:protfolio/routes.dart';

import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      initialRoute: 'about',
      routes: {
        MyRoutes.about: (context) => const AboutPage(),
        MyRoutes.project: (context) => const ProjectPage()
      },
    );
  }
}
