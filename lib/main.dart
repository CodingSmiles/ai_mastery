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
      theme: ThemeData(

        colorSchemeSeed: Palette.calmBlue,
        useMaterial3: true,
      ),
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
    return Scaffold(
      backgroundColor: Palette.calmBlue,
      appBar: const CAppBar(
        title: "AI Mastery",
        centerTitle: true,
      ),
      body: LoginPage(
        key: widget.key,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a value first";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        "User ID",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.offWhite),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const CAppBar(
      {super.key, required this.title, required this.centerTitle, this.bottom});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      scrolledUnderElevation: 4.0,
      backgroundColor: Palette.calmBlue,
      centerTitle: centerTitle,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            semanticLabel: 'More Options',
          ),
        )
      ],
      title: Text(
        title,
        textScaleFactor: ScaleSize.textScaleFactor(context),
        style: const TextStyle(
          fontSize: 28,
        ),
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

class Palette {
  static const Color calmBlue = Color.fromRGBO(47, 156, 149, 1);
  static const Color lightBlue = Color.fromRGBO(64, 201, 162, 1);
  static const Color darkBlue = Color.fromRGBO(10, 96, 142, 1);
  static const Color offWhite = Color.fromRGBO(255, 251, 244, 1);
}
