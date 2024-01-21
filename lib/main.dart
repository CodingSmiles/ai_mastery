import "package:flutter/material.dart";
import "dart:math";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      title: "Testing",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CAppBar(
        title: "AI Mastery",
        centerTitle: true,
      ),
    );
  }
}

// adding some code for text scaling
class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  const CAppBar({super.key, required this.title, required this.centerTitle});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        title,
        textScaleFactor: ScaleSize.textScaleFactor(context),
        style: const TextStyle(
          fontSize: 28,
          fontFamily: 'Inter',
          letterSpacing: 2,
        ),
      ),
    );
  }
}
