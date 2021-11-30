import 'package:dfinsta/widgets/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform:
                InAppWebViewOptions(useShouldOverrideUrlLoading: true),
          ),
          initialUrlRequest: URLRequest(
            url: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Uri.parse("https://www.instagram.com/?theme=dark")
                : Uri.parse("https://www.instagram.com/"),
          ),
          onWebViewCreated: (webController) {
            controller.webViewController = webController;
          },
          onLoadStop: (webController, url) async {
            Uri? currentUrl = await webController.getUrl();
            String css = controller.getHideCss(currentUrl);
            await webController.injectCSSCode(source: css);
          },
          shouldOverrideUrlLoading: (webController, navigationAction) async {
            Uri? currentUrl = navigationAction.request.url;
            print(currentUrl);
            String css = controller.getHideCss(currentUrl);
            await webController.injectCSSCode(source: css);
            return NavigationActionPolicy.ALLOW;
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(
              const SettingsBottomSheet(),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Get.bottomSheet(
                    const SettingsBottomSheet(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
