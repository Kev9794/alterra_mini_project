import 'package:alterra_mini_project/views/screens/edit_barang_page.dart';
import 'package:alterra_mini_project/views/screens/input_barang_page.dart';
import 'package:alterra_mini_project/views/screens/list_barang_page.dart';
import 'package:alterra_mini_project/views/screens/on_boarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warehouse App',
      initialRoute: '/',
      routes: {
        '/': (_) => const OnBoardingPage(),
        '/welcome': (_) => const OnBoardingPage(),
        '/list': (_) => const ListBarang(),
        '/input': (_) => const InputBarang(),
        '/edit': (_) => const EditBarang(),
      },
    );
  }
}
