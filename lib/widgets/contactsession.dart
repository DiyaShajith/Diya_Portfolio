import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/widgets/customtextfield.dart';

class Contactsession extends StatelessWidget {
  const Contactsession({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          const Text(
            "Get in touch",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Row(
              children: [
                Flexible(
                  child: Customtextfield(
                    hintText: "Your name",
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Customtextfield(
                    hintText: "Your email",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Customtextfield(
              hintText: "Your message",
              maxLines: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Get in touch"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: const Divider()),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/instagram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/telegram.png",
                  width: 28,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
