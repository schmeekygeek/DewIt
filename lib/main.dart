import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'style.dart';
import 'providers/task_model.dart';
import 'providers/theme_model.dart';
import 'services/shared_prefs_service.dart';

main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeModel()),
    ChangeNotifierProvider(create: (_) => TaskModel()),
  ], child: const MyApp()));
}

const ThemeSelector selector = ThemeSelector();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SharedPreferencesService.init();
    context.read<TaskModel>().initPrefs();
    context.read<ThemeModel>().initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeModel>().isDark
          ? selector.buildDarkTheme()
          : selector.buildLightTheme(),
      home: const Home(),
    );
  }
}
