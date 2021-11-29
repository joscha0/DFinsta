import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  RxBool get hideExplore => RxBool(box.read("hideExplore") ?? true);
  RxBool get hideStories => RxBool(box.read("hideStories") ?? false);
  RxBool get hideFeed => RxBool(box.read("hideFeed") ?? false);

  void setHideExplore(bool val) => box.write("hideExplore", val);
  void setHideStorie(bool val) => box.write("hideStories", val);
  void setHideFeed(bool val) => box.write("hideFeed", val);

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
