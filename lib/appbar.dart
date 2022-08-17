import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  /// Appbar widget with below elements
  final String leadingIcon;
  final String trailingIcon;
  final Function? leadingOnTap;
  final Function? trailingOnTap;
  final String title;
  final double height;
  final bool isPendingRequest;
  const CustomAppbar(
      {this.leadingIcon = "",
      this.trailingIcon = "",
      this.trailingOnTap,
      this.leadingOnTap,
      this.title = "",

      /// Initialization of height with value 30
      this.height = 30,

      /// Initialization of isPendingRequest with value false
      this.isPendingRequest = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Preferred size widget with title and icon children widgets
    return PreferredSize(
      preferredSize: preferredSize,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 46, 0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(

                    /// Top layout title
                    child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                )),

                /// Check whether trailingIcon is empty or not. if it is empty, SizedBox widget will be displayed
                trailingIcon.isEmpty
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          /// On tap event
                          trailingOnTap!();
                        },
                        child: Image(
                          image: AssetImage(trailingIcon),
                          fit: BoxFit.contain,
                          width: 30,
                          height: height,
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Preferred size
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
