import 'package:dfinsta/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

  @override
  _SettingsBottomSheetState createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  bool hideExplore = true;
  bool hideSuggestions = true;
  bool hideStories = false;
  bool hideFeed = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => (Container(
        color: Theme.of(context).backgroundColor,
        child: Wrap(
          children: [
            Column(
              children: [
                SwitchListTile(
                  title: const Text('hide Feed'),
                  value: hideFeed,
                  onChanged: (bool value) {
                    setState(() {
                      hideFeed = value;
                    });
                    controller.hideFeed.value = value;
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
