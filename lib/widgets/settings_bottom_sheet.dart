import 'package:dfinsta/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

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
                  SwitchListTile(
                    title: const Text('hide Explore'),
                    value: hideExplore,
                    onChanged: (bool value) {
                      setState(() {
                        hideExplore = value;
                      });
                      controller.setHideExplore(value);
                    },
                  ),
                  SwitchListTile(
                    title: const Text('hide Stories'),
                    value: hideStories,
                    onChanged: (bool value) {
                      setState(() {
                        hideStories = value;
                      });
                      controller.setHideStorie(value);
                    },
                  ),
                  SwitchListTile(
                    title: const Text('hide Feed'),
                    value: hideFeed,
                    onChanged: (bool value) {
                      setState(() {
                        hideFeed = value;
                      });
                      controller.setHideFeed(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
