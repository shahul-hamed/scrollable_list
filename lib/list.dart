import 'package:flutter/cupertino.dart';

/// Class represents the default structure with following parameters
class CommonList {
  String? label;
  String? content;
  IconData? icon;
  Image? image;
  Widget? mainWidget;
  int uniqueID = 0;

  CommonList(
      {this.label,
      this.content,
      this.image,
      this.mainWidget,
      this.icon,
      required this.uniqueID});

  CommonList.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    content = json['content'];
    uniqueID = json['id'];
    icon = json['icon'];
    mainWidget = json['widget'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['content'] = content;
    data['id'] = uniqueID;
    data['icon'] = icon;
    data['widget'] = mainWidget;
    data['image'] = image;
    return data;
  }
}
