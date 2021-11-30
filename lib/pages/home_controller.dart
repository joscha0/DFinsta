import 'package:dfinsta/widgets/settings_bottom_sheet.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  InAppWebViewController? webViewController;

  final box = GetStorage();
  RxBool get hideExplore => RxBool(box.read("hideExplore") ?? true);
  RxBool get hideStories => RxBool(box.read("hideStories") ?? false);
  RxBool get hideFeed => RxBool(box.read("hideFeed") ?? false);

  void setHide(String key, bool value) {
    box.write(key, value);
    webViewController?.reload();
  }

  String cssHideFeed = """
main > section > div:nth-child(3){
  display: none!important;
  }
""";

  String cssHideStories = """
main > section > div:first-child {
  display: none!important;
}
""";

  String cssHideExplore = """
[role=main] {
   display: none!important;
}
""";

  String getHideCss(Uri? url) {
    print(url!.path);

    String css = "";

    switch (url.path) {
      case "/":
        {
          if (hideFeed.value) {
            css += cssHideFeed;
          }
          if (hideStories.value) {
            css += cssHideStories;
          }
        }

        break;
      case "/explore":
        {
          if (hideExplore.value) {
            css += cssHideExplore;
          }
        }
        break;
      default:
    }

    return css;
  }
}
