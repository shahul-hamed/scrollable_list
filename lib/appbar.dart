import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  final String leadingIcon;
  final String trailingIcon;
  final Function? leadingOnTap;
  final Function? trailingOnTap;
  final String title;
  final double height;
  final bool isPendingRequest;
   const CustomAppbar({this.height=30,this.title="",this.isPendingRequest=false,this.trailingOnTap,this.leadingOnTap,this.leadingIcon="",this.trailingIcon="",Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Text(title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
