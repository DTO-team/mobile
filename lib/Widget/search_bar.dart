import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'color.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.routeTo}) : super(key: key);
  final VoidCallback routeTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: routeTo,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.symmetric(horizontal: 10.5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - Search Box
            Expanded(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: AppColor.primarySoft),
                child: Row(
                  children: [
                    ImageIcon(Svg('assets/Search.svg'), color: AppColor.secondary, size: 18),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Enter Topic?',
                        style: TextStyle(color: AppColor.secondary.withOpacity(0.3)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Right side - filter button
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondary,
              ),
              child: ImageIcon(Svg('assets/filter.svg')),
            )
          ],
        ),
      ),
    );
  }
}
