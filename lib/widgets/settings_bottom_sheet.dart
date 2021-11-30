import 'package:DFinsta/pages/home_controller.dart';
import 'package:DFinsta/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:get/get.dart';

class SettingsBottomSheet extends StatefulWidget {
  InAppWebViewController? webViewController;
  SettingsBottomSheet({
    Key? key,
    required this.webViewController,
  }) : super(key: key);

  @override
  _SettingsBottomSheetState createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  late bool hideExplore, hideStories, hideFeed;

  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      initState: (ctr) {
        hideExplore = controller.hideExplore.value;
        hideStories = controller.hideStories.value;
        hideFeed = controller.hideFeed.value;
      },
      builder: (_) => (Container(
        color: Theme.of(context).backgroundColor,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "DFinsta",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SwitchListTile(
                    title: const Text('hide Explore'),
                    value: hideExplore,
                    onChanged: (bool value) {
                      setState(() {
                        hideExplore = value;
                      });
                      controller.setHide("hideExplore", value);
                      widget.webViewController
                          ?.injectCSSCode(source: controller.getHideCss());
                      widget.webViewController?.reload();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('hide Stories'),
                    value: hideStories,
                    onChanged: (bool value) {
                      setState(() {
                        hideStories = value;
                      });
                      controller.setHide("hideStories", value);
                      widget.webViewController
                          ?.injectCSSCode(source: controller.getHideCss());
                      widget.webViewController?.reload();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('hide Feed'),
                    value: hideFeed,
                    onChanged: (bool value) {
                      setState(() {
                        hideFeed = value;
                      });
                      controller.setHide("hideFeed", value);
                      widget.webViewController
                          ?.injectCSSCode(source: controller.getHideCss());
                      widget.webViewController?.reload();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(HomePage());
                    },
                    child: const Text("restart app"),
                  ),
                  Text("(if the dark mode turns of)"),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
