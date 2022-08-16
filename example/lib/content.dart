import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        style: TextStyle(fontSize: 15,height: 1.6)),
        const SizedBox(height: 20,),
        const Text("Actions",
            style: TextStyle(fontSize: 18)),
        const SizedBox(height: 10,),
        ListView.builder(shrinkWrap: true,scrollDirection: Axis.vertical,
          itemCount: 6,
          itemBuilder: (BuildContext context,int index)=>
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(decoration: BoxDecoration(color: Colors.grey[50],
                  border: Border.all(color: Colors.grey[100]!),
                  borderRadius:BorderRadius.circular(10) ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_rounded,color: Colors.black38,size: 20,),
                      const SizedBox(width: 7,),
                      Text("Action ${index+1} - You can Navigate through this",
                          style: const TextStyle(fontSize: 15,height: 1.3)),
                    ],
                  ),
                ),
              ),
            ),
        ),

      ],
    );
  }
}
