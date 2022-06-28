import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:flutter/material.dart';

class DemoAPI extends StatefulWidget {
  const DemoAPI({Key? key}) : super(key: key);

  @override
  State<DemoAPI> createState() => _DemoAPIState();
}

class _DemoAPIState extends State<DemoAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Name of Topic this semester',
                style: AppTextSytle.tittleTextStyle,
              )),
          const Text(
            'Lecturer',
            style: AppTextSytle.subTitle2TextStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: whiteSoft,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: blue,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/chamb.png'),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hoang Cac Loan Chau(K15 HCM)',
                      style: AppTextSytle.subTitle1TextStyle,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'chauhclse150664@fpt.edu.vn',
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
