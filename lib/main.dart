import 'package:flutter/material.dart';
import 'package:kupro/presentation/bottom_navigation/bottom_navigation_view.dart';
import 'package:kupro/presentation/details/providers/size_provider.dart';
import 'package:kupro/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (context) => SizeProvider.instance),
        // Add more providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
