import 'package:dfinsta/pages/home_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.pink,
          primary: Colors.pink,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.pink,
            primary: Colors.pink,
          )),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
