import 'package:DFinsta/widgets/settings_bottom_sheet.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  RxBool get hideExplore => RxBool(box.read("hideExplore") ?? true);
  RxBool get hideStories => RxBool(box.read("hideStories") ?? false);
  RxBool get hideFeed => RxBool(box.read("hideFeed") ?? false);

  void setHide(String key, bool value) {
    box.write(key, value);
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
main > div > div > div {
   display: none!important;
}
""";

  String cssHideNavBar = """
#react-root > section > :nth-child(4) {
  display: none!important;
}
""";

  String getHideCss() {
    String css = "";

    // css += cssHideNavBar;

    if (hideFeed.value) {
      css += cssHideFeed;
    }
    if (hideStories.value) {
      css += cssHideStories;
    }

    if (hideExplore.value) {
      css += cssHideExplore;
    }

    return css;
  }
}
