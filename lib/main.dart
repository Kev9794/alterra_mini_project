import 'package:alterra_mini_project/views/provider/edit_provider.dart';
import 'package:alterra_mini_project/views/provider/input_provider.dart';
import 'package:alterra_mini_project/views/screens/input_barang_page.dart';
import 'package:alterra_mini_project/views/screens/list_barang_page.dart';
import 'package:alterra_mini_project/views/screens/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EditProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InputProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Warehouse App',
        initialRoute: '/',
        routes: {
          '/': (_) => const OnBoardingPage(),
          '/welcome': (_) => const OnBoardingPage(),
          '/list': (_) => const ListBarang(),
          '/input': (_) => const InputBarang(),
        },
      ),
    );
  }
}
