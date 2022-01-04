import 'package:flutter/material.dart';
import '../theme.dart';

class Info extends StatelessWidget {
  final String name;
  final String imageUrl;
  Info({required this.imageUrl,required this.name});
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            imageUrl,
            width: 14,
          ),
        ),
        SizedBox(width: 5,),
        Text(name,style: grayTextStyle.copyWith(fontSize: 12),)
      ],
    );
  }
}
