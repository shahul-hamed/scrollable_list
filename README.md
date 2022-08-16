# Scrollable List

A New Flutter package which helps to scroll the content with their respective bottom bar menu for android and ios.

## Features

* Effective scroll with active tab indication

## Getting started

* Install this package for scrollable main contents with bottom bar

## Install

* Add the dependency

dependencies:
  scrollable_list: ^0.0.1

* Import the package

```dart
import 'package:scrollable_list/scrollable_list.dart';
```

## How to use

* Take list of bottom menus with title, icon and unique id.

* Write list of body contents with title , content and unique id.

* Make list as CommonList structure.

* Must use same unique id for scrolling specific content purpose.

## Screenshots

<img src="home.jpg" height="300em" />
<img src="search.jpg" height="300em" />

## Example

```dart
class ScrollablePage extends StatelessWidget {
  final String title;
   ScrollablePage({Key? key,this.title = ""}) : super(key: key);
  /* Here we have the list of main content type CommonList, which is occupy the body of the page */ 
 /* Each common list has the label , content and icon */
   final list = <CommonList>[
     CommonList(uniqueID: 1,content:"Home page",label: "Home" ),
     CommonList(uniqueID: 2,content:"Search page",label: "Search" ),
     CommonList(uniqueID: 3,content:"Profile page",label: "Profile" ),
   ];
      /*Here we have the list of bottom content type CommonList, which is occupy the bottom of the page */
   final bottomList = [
     CommonList(uniqueID: 1,content:"",label: "Home",icon: Icons.home, ),
     CommonList(uniqueID: 2,content:"",label: "Search",icon: Icons.search_rounded, ),
     CommonList(uniqueID: 3,content:"",label: "Profile",icon: Icons.person, ),
   ];
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
/* here we need to pass the body and bottom content to the page  */
    return SafeArea(
      child: ScrollableWidget(
        scrollController: controller,bodyContent: list,bottomContent: bottomList,
        appbar: CustomAppbar(title: title,),selectedColor: Colors.blue,unSelectedColor: Colors.black38,
      )

    );
  }
}
```
## Additional information

* This package has some required information for maintaining the scroll event with relevant bottom bar menu.

* This package uses the two list one is for body page content and another one is bottom bar content.

* Here , you can create own page contents for all pages.

* This package supports four menu with scrolling and navigation controls.


