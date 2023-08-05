import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'screens/input_screen.dart';
import 'screens/map_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/round_button_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map App',
      initialRoute: '/input',
      routes: {
        '/input': (context) => InputScreen(),
        '/map': (context) => MapScreen(),
        '/chat': (context) => ChatScreen(),
        '/roundButton': (context) => RoundButtonScreen(),
      },
    );
  }
}
