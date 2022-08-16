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
  const ScrollableWidget(
      {Key? key,
      required this.scrollController,
      this.selectedIndex = 0,
      this.isSelected = false,
      this.selectedColor = Colors.black,
      this.unSelectedColor = Colors.black26,
      this.isBottomLabelOnly = false,
      required this.bodyContent,
      required this.bottomContent,
      this.appbar = const CustomAppbar(
        title: "Scrollable List",
      )})
      : super(key: key);

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
          children: widget.bodyContent
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 10),
                    child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            Text(e.content.toString(),
                                style: const TextStyle(fontSize: 18)),
                            e.mainWidget!
                          ],
                        )),
                  ))
              .toList(),
        ),
        onNotification: (t) {
          if (t is ScrollEndNotification) {}
          setState(() {
            if (MediaQuery.of(context).size.width <
                    widget.scrollController.position.pixels &&
                widget.scrollController.position.pixels <
                    MediaQuery.of(context).size.width * 2) {
              currentIndex = 1;
            } else if (MediaQuery.of(context).size.width * 2 <
                widget.scrollController.position.pixels &&
                widget.scrollController.position.pixels <
                    MediaQuery.of(context).size.width * 3) {
              currentIndex = 2;
            }
            else if (MediaQuery.of(context).size.width * 3 <
                widget.scrollController.position.pixels) {
              currentIndex = 3;
            }
            else if (MediaQuery.of(context).size.width >
                widget.scrollController.position.pixels) {
              currentIndex = 0;
            }
          });

          // controller.currentindex.value = scrollController.position.pixels == 0.0?0:(scrollController.position.pixels>=21 && scrollController.position.pixels<=450 )?1:2
          return isExtended;
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: widget.bottomContent.asMap().entries
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () {
                          // unique id must be same
                          setState(() {
                            currentIndex = e.key;
                          });
                          // print("index${e.value.uniqueID}");
                          // print("index$currentIndex");
                          widget.scrollController.animateTo((currentIndex.toDouble() *
                              MediaQuery.of(context).size.width)+(currentIndex !=0?currentIndex*20:0), duration: const Duration(milliseconds: 1), curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: Column(
                          children: [
                            widget.isBottomLabelOnly
                                ? const SizedBox()
                                : Icon(
                                    e.value.icon,
                                    size: 30,
                                    color: currentIndex ==e.key

                                        ? widget.selectedColor
                                        : widget.unSelectedColor,
                                  ),
                            Text(
                              e.value.label.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: currentIndex == e.key
                                      ? widget.selectedColor
                                      : widget.unSelectedColor),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  int currentIndex = 0;
  bool isExtended = false;
}
