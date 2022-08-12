import 'package:flutter/material.dart';
import 'package:scrollable_list/appbar.dart';
import 'package:scrollable_list/list.dart';
import 'package:scrollable_list/scrollable_list.dart';

class ScrollablePage extends StatelessWidget {
  final String title;
   ScrollablePage({Key? key,this.title = ""}) : super(key: key);

   final list = <CommonList>[
     CommonList(uniqueID: 1,content:"Home page",label: "Home" ),
     CommonList(uniqueID: 2,content:"Search page",label: "Search" ),
     CommonList(uniqueID: 3,content:"Profile page",label: "Profile" ),
   ];
   final bottomList = [
     CommonList(uniqueID: 1,content:"",label: "Home",icon: Icons.home, ),
     CommonList(uniqueID: 2,content:"",label: "Search",icon: Icons.search_rounded, ),
     CommonList(uniqueID: 3,content:"",label: "Profile",icon: Icons.person, ),
   ];
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollableWidget(
        scrollController: controller,bodyContent: list,bottomContent: bottomList,
        appbar: CustomAppbar(title: title,),selectedColor: Colors.blue,unSelectedColor: Colors.black38,
      )

    );
  }
}
