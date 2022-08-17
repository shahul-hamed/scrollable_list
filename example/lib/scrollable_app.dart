import 'package:flutter/material.dart';
import 'package:scrollable_list/appbar.dart';
import 'package:scrollable_list/list.dart';
import 'package:scrollable_list/scrollable_list.dart';

import 'content.dart';

/// Class ScrollablePage with title argument
class ScrollablePage extends StatelessWidget {
  final String title;
  ScrollablePage({Key? key, this.title = ""}) : super(key: key);

  /// Unique id must be the same value in the below list
  /// A list and bottom list with uniqueID , content , label , mainWidget
  final list = <CommonList>[
    CommonList(
        uniqueID: 1,
        content: "Home page",
        label: "Home",
        mainWidget: const Content()),
    CommonList(
        uniqueID: 2,
        content: "Search page",
        label: "Search",
        mainWidget: const Content()),
    CommonList(
        uniqueID: 3,
        content: "Profile page",
        label: "Profile",
        mainWidget: const Content()),
    CommonList(
        uniqueID: 4,
        content: "Settings page",
        label: "Settings",
        mainWidget: const Content()),
  ];
  final bottomList = [
    CommonList(
      uniqueID: 1,
      content: "",
      label: "Home",
      image: "assets/images/home.png",
      icon: Icons.home,
    ),
    CommonList(
      uniqueID: 2,
      content: "",
      label: "Search",
      icon: Icons.search_rounded,
    ),
    CommonList(
      uniqueID: 3,
      content: "",
      label: "Profile",
      height: 23,
      icon: Icons.person,
    ),
    CommonList(
      uniqueID: 4,
      content: "",
      label: "Settings",
      icon: Icons.settings,
    ),
  ];
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(
      scrollController: controller,
      bodyContent: list,
      bottomContent: bottomList,
      /// Customized app bar widget
      appbar: CustomAppbar(
        title: title,
      ),
      /// Size of the icon
      iconSize: 26,
      /// Color represents the selected element
      selectedColor: Colors.blue,
      /// Color represents the unselected element
      unSelectedColor: Colors.black38,
    );
  }
}
