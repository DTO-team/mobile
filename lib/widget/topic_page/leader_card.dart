import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/color.dart';
import '../../constant/text_style.dart';
class leader_card extends StatelessWidget {
  const leader_card({
    Key? key,
    this.name,
    this.avatar,
    this.email, this.icon,
  }) : super(key: key);
  final name;
  final avatar;
  final email;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(7),
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
              Row(
                children: [
                  Container(
                    child: Text(
                      name,
                      style: AppTextSytle.subTitle1TextStyle,
                    ),),
                  SizedBox(width: 10,),
                  SvgPicture.asset(icon, height: 13,width: 13,color: secondary,),
                ],
              ),
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
