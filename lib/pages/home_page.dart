import 'package:dfinsta/widgets/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  final String url = "https://instagram.com/";

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(useShouldOverrideUrlLoading: true),
        ),
        initialUrlRequest: URLRequest(
          url: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Uri.parse(url + "?theme=dark")
              : Uri.parse(url),
        ),
        onWebViewCreated: (webController) {
          controller.webViewController = webController;
        },
        onLoadStop: (webController, url) async {
          Uri? currentUrl = await webController.getUrl();
          String css = controller.getHideCss();
          await webController.injectCSSCode(source: css);
        },
        shouldOverrideUrlLoading: (webController, navigationAction) async {
          Uri? currentUrl = navigationAction.request.url;
          print(currentUrl);
          String css = controller.getHideCss();
          await webController.injectCSSCode(source: css);
          return NavigationActionPolicy.ALLOW;
        },
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Theme.of(context).backgroundColor,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.settings),
            label: "settings",
            onTap: () {
              Get.bottomSheet(
                const SettingsBottomSheet(),
              );
            },
          ),
          SpeedDialChild(
              child: const Icon(Icons.person),
              label: "profile",
              onTap: () {
                controller.webViewController?.loadUrl(
                    urlRequest: URLRequest(
                  url: Uri.parse(url + "profile"),
                ));
              }),
          SpeedDialChild(
            child: const Icon(Icons.home),
            label: "home",
          ),
        ],
      ),
    );
  }
}
