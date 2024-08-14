import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (screenSize.width < 900)
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    "assets/IMG_20240805_001346_550.jpg",
                  ),
                ),
              const Text(
                "DIYA SHAJITH K\nFlutter Developer",
                style: TextStyle(
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get in Touch"),
                ),
              )
            ],
          ),
          if (screenSize.width > 900)
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                "assets/IMG_20240805_001346_550.jpg",
              ),
            )
        ],
      ),
    );
  }
}
