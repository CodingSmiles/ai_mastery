import "package:flutter/material.dart";
import "dart:math";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      title: "AI Mastery",
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
        title: "Login",
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
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: 12.0,
        ),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a value first";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                label: Text(
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  ),
                  "User ID",
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person,
                ),
                fillColor: Palette.offWhite,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              cursorWidth: 2,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a value first";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                label: Text(
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  ),
                  "Password",
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.password,
                ),
                fillColor: Palette.offWhite,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              cursorWidth: 2,
              obscureText: true,
            ),
            const SizedBox(
              height: 14,
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
                backgroundColor: Palette.offWhite,
              ),
              child: const Text('Submit'),
            ),
            const Spacer(),
            const Divider(
              height: 4,
              thickness: 2.5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(6.5),
                  child: Text(
                    textScaler: TextScaler.linear(
                      ScaleSize.textScaleFactor(context),
                    ),
                    'Terms & Conditions',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
        textScaler: TextScaler.linear(
          ScaleSize.textScaleFactor(context),
        ),
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}

class ScaleSize {
  // adding some code for text scaling
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
