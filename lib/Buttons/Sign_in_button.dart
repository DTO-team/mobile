import 'package:capstone_management_dto/Buttons/Button_Type.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double height;
  static const double borderRadius = 4.0;
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
      child: ElevatedButton(
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

  Row buildRow() {
    switch (button) {
      case ButtonType.Google:
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
      case ButtonType.Signin:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.email,
            ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            Opacity(
              opacity: 0.0,
              child: Icon(
                Icons.email,
              ),
            ),
          ],
        );
    }
  }
}
