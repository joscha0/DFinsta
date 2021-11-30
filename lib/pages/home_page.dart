import 'package:DFinsta/widgets/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final String url = "https://instagram.com/";
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: InAppWebView(
        key: webViewKey,
        onWebViewCreated: (webController) {
          webViewController = webController;
          webViewController?.loadUrl(
              urlRequest: URLRequest(
            url: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Uri.parse(url + "?theme=dark")
                : Uri.parse(url),
          ));
        },
        onLoadStop: (webController, url) async {
          String css = controller.getHideCss();
          await webViewController?.injectCSSCode(source: css);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: FloatingActionButton.small(
          onPressed: () {
            Get.bottomSheet(
              SettingsBottomSheet(webViewController: webViewController),
            );
          },
          child: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
