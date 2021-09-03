import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema Seçimi Yapınız"),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Text green = Text("Green",style: TextStyle(color: Colors.green),);
    Text red = Text("Red",style: TextStyle(color: Colors.red),);
    bool _value = Provider.of<ColorThemeData>(context).isGreen;




    return Card(
      child: SwitchListTile(
        subtitle: _value?green:red,
        title: Text("Change The Theme Color",style: TextStyle(color: Colors.black),),
        value: _value,
        onChanged: (bool value) {

         Provider.of<ColorThemeData>(context,listen: false).switchTheme(value);

        },
      ),
    );
  }
}
