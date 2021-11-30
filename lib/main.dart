import 'package:DFinsta/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Permission.camera.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final Color primaryColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        switchTheme: SwitchThemeData(
          thumbColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return primaryColor;
            }
          }),
          trackColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.pinkAccent;
            }
          }),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: primaryColor,
          primary: primaryColor,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          switchTheme: SwitchThemeData(
            thumbColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return primaryColor;
              }
            }),
            trackColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.pinkAccent;
              }
            }),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: primaryColor,
            primary: primaryColor,
          )),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
