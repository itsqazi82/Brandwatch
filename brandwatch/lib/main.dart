import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'pages/sign_in.dart';
import 'pages/home_page.dart';
import 'theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Luxury Wear',
    theme: ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.deepPurple,
        secondary: Colors.amber,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    ),
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: Colors.deepPurple[300]!,
        secondary: Colors.amber[300]!,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[800],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    ),
    themeMode: themeProvider.themeMode,
    home: const AuthWrapper(),
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/signin':
          return PageTransition(
            child: const SignInPage(),
            type: PageTransitionType.fade,
            settings: settings,
          );
        case '/home':
          return PageTransition(
            child: const HomePage(),
            type: PageTransitionType.fade,
            settings: settings,
          );
        default:
          return null;
      }
    },
  );
}
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInPage();
  }
}