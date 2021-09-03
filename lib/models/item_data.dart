import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [

  ];
  static SharedPreferences _sharedPref;
  List<String> _itemsAsStrig=[];


  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);


    notifyListeners();
  }

  void addItem(String title,String subtitle) {
    _items.add(Item(title: title,subtitle: subtitle ));
    saveItemsToSharedPref(_items);

    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);

    notifyListeners();
  }
 void updateItem(int index,String title,String subtitle){
    deleteItem(index);
    addItem(title, subtitle);


 }
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  List<String> stringList = [];

Future<void> createPrefObject()async{
  _sharedPref = await SharedPreferences.getInstance();

  }
void saveItemsToSharedPref(List<Item> items){
  _itemsAsStrig.clear();
  for(var item in items){
    _itemsAsStrig.add(json.encode(item.toMap()));

  }
  _sharedPref.setStringList("itemsList", _itemsAsStrig);


}

void loadItemsFromSharedPref(){
  List<String> tempList= _sharedPref.getStringList("itemsList")??[];
  _items.clear();
  for(var item in tempList){
_items.add(Item.fromMap(json.decode(item)));

  }

}


}
