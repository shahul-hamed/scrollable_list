import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String leadingIcon;
  final String trailingIcon;
  final Function? leadingOnTap;
  final Function? trailingOnTap;
  final String title;
  final double height;
  final bool isPendingRequest;
  const CustomAppbar(
      {this.height = 30,
      this.title = "",
      this.isPendingRequest = false,
      this.trailingOnTap,
      this.leadingOnTap,
      this.leadingIcon = "",
      this.trailingIcon = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SizedBox(
        width: MediaQuery.of(context).size.width, height: 90,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 46, 0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: Text(title,style: const TextStyle(color: Colors.black,fontWeight:FontWeight.w500,fontSize: 19,),)),
                trailingIcon.isEmpty?const SizedBox():InkWell(onTap: (){trailingOnTap!();},
                    child: Image(image: AssetImage(trailingIcon),fit: BoxFit.contain,width: 30,height: height,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
