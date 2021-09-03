class Item{
   String title;
   String subtitle;
  bool isDone;
Item({this.title,this.subtitle,this.isDone=false});

void toggleStatus(){
  isDone=!isDone;
}
Item.fromMap(Map<String,dynamic> map){
title = map["title"];
isDone = map["isDone"];
subtitle = map["subtitle"];
}

 Map<String,dynamic> toMap()=> {"title": title,"isDone":isDone,"subtitle":subtitle};




}
