import 'package:capstone_management/constant/color.dart';
import 'package:flutter/material.dart';

class EditUserInfoTile extends StatelessWidget {
  final String label, value;
  final EdgeInsetsGeometry margin, padding;
  final Color valueBackground;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const EditUserInfoTile(
      {required this.label,
      required this.value,
      required this.padding,
      required this.margin,
      required this.valueBackground,
      this.validator,
      this.onSaved,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(label,
                style: const TextStyle(color: primary, fontSize: 12)),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(2, 2), // changes position of shadow
              ),
            ], color: whiteSoft, borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child: TextFormField(
                controller: TextEditingController(text: value),
                decoration: const InputDecoration(),
                validator: validator,
                onSaved: onSaved,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
