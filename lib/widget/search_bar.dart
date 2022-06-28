import 'package:capstone_management/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.routeTo}) : super(key: key);
  final VoidCallback routeTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: routeTo,
      child: Container(
        decoration: const BoxDecoration(color: whiteSoft),
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
                    const ImageIcon(Svg('assets/Search.svg'),
                        color: black, size: 18),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 60 / 100,
                        child: const TextField(
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Topic'),
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
