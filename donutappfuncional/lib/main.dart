import 'package:donutappfuncional/pages/account_page.dart';
import 'package:donutappfuncional/pages/email_verification_page.dart';
import 'package:donutappfuncional/pages/forgot_password_page.dart';
import 'package:donutappfuncional/pages/home_page.dart';
import 'package:donutappfuncional/pages/login_page.dart';
import 'package:donutappfuncional/pages/register_page.dart';
import 'package:donutappfuncional/pages/update_password_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // For now, we'll start with the login page
      // Later your colleague can add authentication logic to determine the initial route
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/email-verification': (context) => const EmailVerificationPage(),
        '/update-password': (context) => const UpdatePasswordPage(),
        '/profile': (context) => const AccountPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

// Helper extension for showing snackbars
extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).colorScheme.primary,
      ),
    );
  }
}

