
import 'package:flutter/cupertino.dart';

class CommonList {
  String? label;
  String? content;
  IconData? icon;
  Image? image;
  int uniqueID=0;

  CommonList({this.label, this.content, this.image, this.icon,required this.uniqueID});

  CommonList.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    content = json['content'];
    uniqueID = json['id'];
    icon = json['icon'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['content'] = content;
    data['id'] = uniqueID;
    data['icon'] = icon;
    data['image'] = image;
    return data;
  }
}