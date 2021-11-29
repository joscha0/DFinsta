import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool hideExplore = true.obs;
  RxBool hideStories = false.obs;
  RxBool hideFeed = false.obs;

  String cssHideFeed = """
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
        }

        break;
      case "/explore":
        break;
      default:
    }

    return css;
  }
}
