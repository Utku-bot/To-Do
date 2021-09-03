import 'package:flutter/material.dart';
import 'package:get_it_done/models/item_data.dart';
import 'package:provider/provider.dart';

class ItemUpdater extends StatelessWidget {
  final _textEditingControllerUp = TextEditingController();
  final _textEditingController2Up = TextEditingController();
  final int index;

   ItemUpdater({Key key, this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                minLines: 1,
                maxLines: 3,
                controller: _textEditingControllerUp,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Yapılacak Değiştir",
                  hintText: "...",
                ),
                autofocus: true,
              ),
              SizedBox(height: 20,),

              TextField(
                minLines: 1,
                maxLines: 3,
                controller: _textEditingController2Up,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Açıklama Değiştir",
                  hintText: "...",
                ),
                autofocus: true,
              ),
              TextButton(
                onPressed: () {

                  Provider.of<ItemData>(context, listen: false)
                      .updateItem(index,_textEditingControllerUp.text,_textEditingController2Up.text);

                  Navigator.pop(context);
                },
                style:TextButton.styleFrom(primary: Theme.of(context).accentColor),

                child: Text("Değiştir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
