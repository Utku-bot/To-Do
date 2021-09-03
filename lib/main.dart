import 'package:flutter/material.dart';
import 'package:get_it_done/models/item_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'models/color_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();

  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (BuildContext context) => ColorThemeData())
  ]));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    // Provider.of<ItemData>(context).loadItemsFromSharedPref();

    return Consumer2<ItemData, ColorThemeData>(
      builder: (context, itemData, colorThemeData, child) {
        itemData.loadItemsFromSharedPref();
        colorThemeData.loadThemeFromSharedPref();

        return MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Provider.of<ColorThemeData>(context).selectedThemeData,
          home: SplashScreen(
              seconds: 1,
              navigateAfterSeconds: new HomePage(),
              title: new Text('Welcome In SplashScreen'),

              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              loaderColor: Colors.red
          )
        );
      },
    );
  }
}
/* Yapılabilcek eklentiler :
*   1 . refactor
*   2 . service
*   3 . itemlerı gesture detector ile editleme
*   5 . görev classları   */