import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double height;
  static const double borderRadius = 20;
  final VoidCallback onPressed;
  final ButtonType button;

  const SignInButton({
    Key? key,
    required this.color,
    required this.onPressed,
    this.height: 50,
    required this.button,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        child: buildRow(),
      ),
    );
  }

   buildRow() {
    switch (button) {
      case ButtonType.google:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/google-logo.png'),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(opacity: 0.0, child: Image.asset('assets/google-logo.png')),
          ],
        );
      case ButtonType.signOut:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: textColor,
              ),
              SizedBox(width: 5,),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15),
              ),
              const Opacity(
                opacity: 0.0,
                child: Icon(
                  Icons.logout,
                ),
              ),
            ],
          ),
        );
    }
  }
}
