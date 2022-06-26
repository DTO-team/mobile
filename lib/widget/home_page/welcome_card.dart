import 'package:capstone_management/constant/color.dart';
import 'package:flutter/material.dart';
class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFaaffa9),
            Color(0xFF11ffbd)

          ]
        )
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(child:
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                text: TextSpan(
                  text: 'WELCOME BACK,\n',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kTitleTextColor),
                  children: [
                    TextSpan(text: 'Hoàng Các Loan Châu!\n'),
                  ]
                ),

              ),
            )
            ),
          ),
          Expanded(child: Image.asset('assets/think.png', scale: 10,))
        ],
      ),
    );
  }
}
