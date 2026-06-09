import 'package:flutter/material.dart';
import 'package:image_search_app/core/di/app_module.dart';
import 'package:image_search_app/core/navigation/router.dart';
import 'package:image_search_app/presentation/list/list_root.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 생성자

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}