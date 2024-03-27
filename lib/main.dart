import 'package:flutter/material.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/router.dart';
import 'package:pokedex_app/themes/poke_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: pokedexTheme,
    );
  }
}
