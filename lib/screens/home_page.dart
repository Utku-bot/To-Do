import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it_done/models/item_data.dart';
import 'package:get_it_done/screens/item_updater.dart';
import 'package:get_it_done/screens/settings_page.dart';
import 'package:get_it_done/widgets/item_card.dart';
import 'package:provider/provider.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
        },icon: Icon(Icons.settings),),],
        centerTitle: true,
        title: Text(
          "Get It Done",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: 150,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "${Provider.of<ItemData>(context).items.length} Items",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                //height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Consumer<ItemData>(builder: (context ,itemData,child){
                    return Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: itemData.items.length,
                        itemBuilder: (context, index) => ItemCard(
                          title: itemData.items[index].title,
                          subtitle: itemData.items[index].subtitle,
                          isDone:
                          itemData.items[index].isDone,
                          toggle: (_) {
                            itemData
                                .toggleStatus(index);

                          },
                          deleteItem: (_){
                            itemData.deleteItem(index);
                          },
                          updateItem: (){
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)),
                                context: context,
                                builder: (context) => ItemUpdater(index: index,));

                          },
                        ),
                      ),
                    );
                  }
                    ,),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              context: context,
              builder: (context) => ItemAdder());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
