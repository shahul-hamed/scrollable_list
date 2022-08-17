import 'package:flutter/material.dart';
import 'package:scrollable_list/appbar.dart';
import 'package:scrollable_list/list.dart';

class ScrollableWidget extends StatefulWidget {
  /// A stateful widget with below elements
  final PreferredSizeWidget appbar;
  final ScrollController scrollController;
  final List<CommonList> bodyContent;
  final List<CommonList> bottomContent;
  final bool isBottomLabelOnly;
  final Color selectedColor;
  final Color unSelectedColor;
  final bool isSelected;
  final int selectedIndex;
  final double titleFont;
  final double subTitleFont;
  final double iconSize;
  const ScrollableWidget(
      {Key? key,

      /// Initialization of customized app bar widget
      this.appbar = const CustomAppbar(
        title: "Scrollable List",
      ),
      required this.scrollController,
      required this.bodyContent,
      required this.bottomContent,
      this.isBottomLabelOnly = false,
      this.selectedColor = Colors.black,
      this.unSelectedColor = Colors.black26,
      this.isSelected = false,
      this.selectedIndex = 0,
        this.titleFont = 18,
        this.subTitleFont = 15,
        this.iconSize = 30})
      : super(key: key);

  @override
  ScrollableWidgetState createState() => ScrollableWidgetState();
}

class ScrollableWidgetState extends State<ScrollableWidget> {
  @override
  Widget build(BuildContext context) {
    /// Scaffold widget has app bar and notification listener as body widget.
    return Scaffold(
      appBar: widget.appbar,
      body: NotificationListener(
        /// Listener to observe the scroll event.
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: widget.scrollController,

          /// Map entries for body content list
          children: widget.bodyContent
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13.0, vertical: 10),
                    child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(e.content.toString(),
                                style:  TextStyle(fontSize: widget.titleFont)),
                            e.mainWidget!
                          ],
                        )),
                  ))
              .toList(),
        ),

        /// Function for listening scroll controls.
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
            } else if (MediaQuery.of(context).size.width * 3 <
                widget.scrollController.position.pixels) {
              currentIndex = 3;
            } else if (MediaQuery.of(context).size.width >
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
            /// Map entries for bottom content list
            children: widget.bottomContent
                .asMap()
                .entries
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // Assigning a index of map object to currentIndex variable.
                            currentIndex = e.key;
                          });

                          /// Scroll position change based on the current index.
                          widget.scrollController.animateTo(
                              (currentIndex.toDouble() *
                                      MediaQuery.of(context).size.width) +
                                  (currentIndex != 0 ? currentIndex * 20 : 0),
                              duration: const Duration(milliseconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: Column(
                          children: [
                            /// Check whether the conditions is true/false , if it is true SizedBox will be displayed.
                            widget.isBottomLabelOnly
                                ? const SizedBox()
                                : e.value.image.isNotEmpty?Image.asset(e.value.image,height: e.value.height,
                              color: currentIndex == e.key
                                  ? widget.selectedColor
                                  : widget.unSelectedColor,
                            ):
                            Icon(
                                    e.value.icon,
                                    size: widget.iconSize,
                                    color: currentIndex == e.key
                                        ? widget.selectedColor
                                        : widget.unSelectedColor,
                                  ),
                              const SizedBox(height: 6,),
                            /// A title of the bottom bar menu
                            Text(
                              e.value.label.toString(),
                              style: TextStyle(
                                  fontSize: widget.subTitleFont,
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

  /// Declaration of variables
  int currentIndex = 0;
  bool isExtended = false;
}
