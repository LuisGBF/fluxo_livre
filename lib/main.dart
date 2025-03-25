import 'package:flutter/material.dart';
import 'cadastro_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      initialRoute: '/cadastro',
      routes: {
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/home': (context) => HomeScreen(), 
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Bem-vindo!'),
      ),
    );
  }
}
