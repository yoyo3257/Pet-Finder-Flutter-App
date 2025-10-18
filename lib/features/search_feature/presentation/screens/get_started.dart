import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/features/search_feature/presentation/screens/home_screen.dart';

import 'buttom_navigation_bar.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget svg = SvgPicture.asset(
      'assets/icon_dog.svg',
      semanticsLabel: 'icon ',
      height: 24,
      width: 24,
      alignment: Alignment.center,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/welcome_img.png', width: 442, height: 305),
            Text(
              'Find Your Best \nCompanion With Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            Text(
              'Join & discover the best suitable pets as per your preferences in your location',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  FancyBottomNav()),
                );
              },
              child: Container(
                width: 297,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff44BDB6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    svg,
                    SizedBox(width: 10),
                    Text(
                      'Get started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
