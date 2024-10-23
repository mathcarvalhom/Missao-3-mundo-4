import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future _initTts() async {
    await _flutterTts.setLanguage("pt-BR");
    await _flutterTts.setSpeechRate(0.6);
  }

  Future _speak() async {
    await _flutterTts.speak("Olá, esse é o aplicativo com retorno de voz.");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.black, // Fundo preto
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Botão laranja
            foregroundColor: Colors.black,  // Texto do botão preto
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange, // AppBar laranja
          foregroundColor: Colors.black,   // Texto da AppBar preto
          centerTitle: true,

        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DOMA'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _speak,
            child: Text('FALE'),
          ),
        ),
      ),
    );
  }
}
