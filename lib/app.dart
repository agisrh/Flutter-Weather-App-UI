import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // title: appTitle,
      // theme: appTheme,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      initialRoute: Routes.root,
      getPages: routes,
      enableLog: true,
      logWriterCallback: localLogWriter,
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    //print('LOG : ' + text);
  }
}
