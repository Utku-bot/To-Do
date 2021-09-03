import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDone;
  final Function toggle;
  final Function deleteItem;
  final Function updateItem;
  ItemCard({this.title,this.subtitle,this.updateItem,this.isDone,this.toggle,this.deleteItem});


@override
Widget build(BuildContext context) {
return Dismissible(
  key: UniqueKey(),
  onDismissed: deleteItem,
  child: Card(
    
    color: isDone?Colors.green.shade50:Colors.white,
  
    elevation: isDone?1:5,
  
    shadowColor: Theme.of(context).primaryColor,
  
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),


  
    child: ListTile(
      leading: IconButton(onPressed: updateItem,icon: Icon(Icons.update),),
  
      title: Text(title, style: TextStyle(color: Colors.black,decoration: isDone?TextDecoration.lineThrough:null),),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.black,decoration: isDone?TextDecoration.lineThrough:null),),

  
      trailing: Checkbox(onChanged: toggle,value: isDone,activeColor: Colors.green,),
  
  
  
    ),
  
  ),
);
}
}
