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
        decoration: BoxDecoration(color: whiteSoft),
        padding: const EdgeInsets.symmetric(horizontal: 10.5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - Search Box
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: [
                    ImageIcon(const Svg('assets/Search.svg'),
                        color: black, size: 18),
                    SizedBox(width: 5,),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*60/100,
                        child: TextField(
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Topic'
                          ),

                        ),
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
                color: primary,
              ),
              child: const ImageIcon(Svg('assets/filter.svg')),
            )
          ],
        ),
      ),
    );
  }
}
