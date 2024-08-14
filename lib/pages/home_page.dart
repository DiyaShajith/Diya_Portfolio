import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/skill_items.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/widgets/drawer_mobile.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : const DrawerMobile(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // MAIN
              if (constraints.maxWidth >= kMinDesktopWidth)
                const HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              const MainDesktop(),

              // SKILLS
              Container(
                width: screenWidth,
                color: CustomColor.bgLight1,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What I can do",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 450),
                            child: Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: [
                                for (int i = 0; i < platformItems.length; i++)
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: CustomColor.bgLight2,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10.0),
                                      leading: Image.asset(
                                        platformItems[i]["img"],
                                        width: 26.0,
                                      ),
                                      title: Text(platformItems[i]["title"]),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 50.0),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 500.0),
                            child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: [
                                for (int i = 0; i < skillItems.length; i++)
                                  Chip(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                    backgroundColor: CustomColor.bgLight2,
                                    label: Text(skillItems[i]["title"]),
                                    avatar: Image.asset(skillItems[i]["img"]),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // PROJECTS
              const SizedBox(
                height: 500,
                width: double.maxFinite,
              ),
              // CONTACT
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              // FOOTER
              const SizedBox(
                height: 500,
                width: double.maxFinite,
              ),
            ],
          ),
        );
      },
    );
  }
}
