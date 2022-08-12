// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:scrollable_list/appbar.dart';
import 'package:scrollable_list/list.dart';

class ScrollableWidget extends StatefulWidget {
  final PreferredSizeWidget appbar;
  final ScrollController scrollController;
  final List<CommonList> bodyContent;
  final List<CommonList> bottomContent;
  final bool isBottomLabelOnly;
  final Color selectedColor;
  final Color unSelectedColor;
  final bool isSelected;
  final int selectedIndex;
  const ScrollableWidget({Key? key,required this.scrollController ,this.selectedIndex =0, this.isSelected=false, this.selectedColor = Colors.black,this.unSelectedColor = Colors.black26,
    this.isBottomLabelOnly =false, required this.bodyContent, required this.bottomContent, this.appbar= const CustomAppbar(title: "Scrollable List",)}) : super(key: key);

  @override
  _ScrollableWidgetState createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      body: NotificationListener(
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: widget.scrollController,
          children: widget.bodyContent.map((e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: Colors.white,width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(e.content.toString(),style: const TextStyle(fontSize: 20))
                  ],
                )),
          )).toList(),
        ),
        onNotification: (t) {
          if (t is ScrollEndNotification) {

          }
          setState(() {
            if(MediaQuery.of(context).size.width < widget.scrollController.position.pixels && widget.scrollController.position.pixels < MediaQuery.of(context).size.width*2 ){
              currentIndex = 1;
            }
            else if(MediaQuery.of(context).size.width *2 < widget.scrollController.position.pixels){
             currentIndex = 2;
            }
            else if(MediaQuery.of(context).size.width > widget.scrollController.position.pixels){
              currentIndex = 0;
            }
          });

          // controller.currentindex.value = scrollController.position.pixels == 0.0?0:(scrollController.position.pixels>=21 && scrollController.position.pixels<=450 )?1:2
          return isExtended;
        },
      ),
      bottomNavigationBar:  SizedBox(height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,shrinkWrap: true,
          children:
          widget.bottomContent.map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: (){
                // unique id must be same
                setState(() {
                  currentIndex =   widget.bodyContent.indexWhere((element) => element.uniqueID == e.uniqueID);
                });
                // print("index$index");
                widget.scrollController.jumpTo(currentIndex.toDouble() * MediaQuery.of(context).size.width);
              },
              child: Column(
                children: [

                  widget.isBottomLabelOnly?const SizedBox():Icon(e.icon,size: 30,color: currentIndex == widget.bodyContent.indexWhere((element) => element.uniqueID == e.uniqueID)?widget.selectedColor:widget.unSelectedColor,),
                  Text(e.label.toString(),style: TextStyle(fontSize: 15,color:currentIndex == widget.bodyContent.indexWhere((element) => element.uniqueID == e.uniqueID)?widget.selectedColor:widget.unSelectedColor ),),
                ],
              ),
            ),
          )).toList(),

        ),
      ),
    );
  }
  int currentIndex = 0;
  bool isExtended = false;
}
