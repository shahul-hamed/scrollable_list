import 'package:flutter/material.dart';
import 'package:scrollable_list/appbar.dart';
import 'package:scrollable_list/list.dart';
import 'package:scrollable_list/scrollable_list.dart';

import 'content.dart';

class ScrollablePage extends StatelessWidget {
  final String title;
  ScrollablePage({Key? key, this.title = ""}) : super(key: key);

  final list = <CommonList>[
    CommonList(uniqueID: 1, content: "Home page", label: "Home",mainWidget: const Content()),
    CommonList(uniqueID: 2, content: "Search page", label: "Search",mainWidget: const Content()),
    CommonList(uniqueID: 3, content: "Profile page", label: "Profile",mainWidget: const Content()),
    CommonList(uniqueID: 4, content: "Settings page", label: "Settings",mainWidget: const Content()),
  ];
  final bottomList = [
    CommonList(
      uniqueID: 1,
      content: "",
      label: "Home",
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
      appbar: CustomAppbar(
    title: title,
      ),
      selectedColor: Colors.blue,
      unSelectedColor: Colors.black38,
    );
  }


}
