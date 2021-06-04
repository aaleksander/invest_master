import 'package:flutter/material.dart';
import 'package:invest_master/pages/accounts_page/accounts_page.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFF0E7AC7),
    100: const Color(0xFF0E7AC7),
    200: const Color(0xFF0E7AC7),
    300: const Color(0xFF0E7AC7),
    400: const Color(0xFF0E7AC7),
    500: const Color(0xFF0E7AC7),
    600: const Color(0xFF0E7AC7),
    700: const Color(0xFF0E7AC7),
    800: const Color(0xFF0E7AC7),
    900: const Color(0xFF0E7AC7),
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инвестиции',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: Center(
        child: AccountsPage(),
      ),
    );
  }
}
