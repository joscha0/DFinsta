import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Uri.parse("https://www.instagram.com/?theme=dark")
              : Uri.parse("https://www.instagram.com/"),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: FloatingActionButton.small(
          onPressed: () {},
          child: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
