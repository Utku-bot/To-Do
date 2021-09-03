import 'package:flutter/material.dart';
import 'package:get_it_done/models/item_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final _textEditingController = TextEditingController();
  final _textEditingController2 = TextEditingController();


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
                controller: _textEditingController,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Yapılacak Ekle",
                  hintText: "...",
                ),
                autofocus: true,
              ),
              SizedBox(height: 20,),

              TextField(
                minLines: 1,
                maxLines: 3,
                controller: _textEditingController2,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Açıklama Ekle",
                  hintText: "...",
                ),
                autofocus: true,
              ),
              TextButton(
                onPressed: () {

                  Provider.of<ItemData>(context, listen: false)
                      .addItem(_textEditingController.text,_textEditingController2.text);

                  Navigator.pop(context);
                },
                style:TextButton.styleFrom(primary: Theme.of(context).accentColor),

                child: Text("Ekle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
