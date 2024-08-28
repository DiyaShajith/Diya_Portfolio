import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_items.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/skill_items.dart';
import 'package:portfolio/styles/style.dart';
import 'package:portfolio/widgets/contactsession.dart';
import 'package:portfolio/widgets/customtextfield.dart';
import 'package:portfolio/widgets/drawer_mobile.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/site_logo.dart';
import 'package:portfolio/widgets/skills_desktop.dart';

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
                    const SizedBox(height: 50),
                    const SkillsDesktop(),
                  ],
                ),
              ),
              // PROJECTS
              const SizedBox(
                height: 500,
                width: double.maxFinite,
              ),
              SizedBox(
                height: 30,
              ),
              // CONTACT
              Contactsession(),
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

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder();
  }
}
