import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class searchSection extends StatefulWidget {
  const searchSection({super.key, required this.searchTextController});

  final TextEditingController searchTextController;

  @override
  State<searchSection> createState() => _searchSectionState();
}

class _searchSectionState extends State<searchSection> {
  Widget svg = SvgPicture.asset(
    'assets/filter.svg',
    semanticsLabel: 'filter icon',
    height: 20,
    width: 20,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 345,
          height: 42,
          decoration: BoxDecoration(
            color: Color(0XffF6F6F6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: widget.searchTextController,
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Color(0xff8F8F8F)),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 9,
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        InkWell(onTap: () {}, child: svg),
      ],
    );
  }
}
