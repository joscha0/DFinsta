import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  String selectedUrl = "https://www.instagram.com/";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => WebviewScaffold(
              url: selectedUrl,
              appBar: AppBar(
                title: const Text('Widget webview'),
              ),
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
            ),
      },
    );
  }
}
