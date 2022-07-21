import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/color.dart';
import '../constant/text_style.dart';
class lec_card extends StatelessWidget {
  const lec_card({
    Key? key,
    this.name,
    this.avatar,
    this.email,
  }) : super(key: key);
  final name;
  final avatar;
  final email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 15),

      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(avatar),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                    name,
                    style: AppTextSytle.subTitle1TextStyle,
                  ),),
              SizedBox(
                height: 2,
              ),
              Container(
                child: Text(
                  email,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
