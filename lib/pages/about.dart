import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/theme_model.dart';
import '../widgets/about_links_item.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            actions: [
              IconButton(
                onPressed: () => context.read<ThemeModel>().toggle(),
                icon: Icon(
                  !context.watch<ThemeModel>().isDark
                      ? Icons.dark_mode_rounded
                      : FontAwesomeIcons.solidLightbulb,
                ),
              ),
            ],
            centerTitle: true,
            title: const Text(
              "ABOUT",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text(
                  "DewIT is a free and open-source application to manage your tasks well, built using the Flutter framework, by,",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 130,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      opacity: 0.89,
                      image: AssetImage("assets/me.jpg"),
                    ),
                  ),
                ),
                Center(
                  child: Stack(children: [
                    const SizedBox(height: 50),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: context.watch<ThemeModel>().isDark
                            ? Colors.white54
                            : Colors.black54,
                        height: 3,
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        wordSpacing: 1,
                      ),
                      child: AnimatedTextKit(
                        pause: const Duration(milliseconds: 800),
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText("DESIGNER"),
                          RotateAnimatedText("DEVELOPER"),
                          RotateAnimatedText("ARTIST"),
                          RotateAnimatedText("WRITER"),
                        ],
                      ),
                    ),
                  ]),
                ),
                const Center(
                  child: Text(
                    "Abdul Samad Shaikh",
                    style: TextStyle(
                      fontFamily: "Madi",
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "Abdul Samad is a self-taught, full-stack developer, based in Mumbai, India\nCheck out his work here:",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LinkItem(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.limeAccent,
                      url: "https://schmeeky.pages.dev",
                      name: "Blog",
                      icon: FontAwesomeIcons.book,
                    ),
                    const LinkItem(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.indigoAccent,
                      url: "https://discord.com/users/687543682269708298",
                      name: " Discord",
                      icon: FontAwesomeIcons.discord,
                    ),
                    LinkItem(
                      foregroundColor: context.watch<ThemeModel>().isDark
                          ? Colors.black87
                          : Colors.white,
                      backgroundColor: !context.watch<ThemeModel>().isDark
                          ? Colors.black87
                          : Colors.white,
                      url: "https://github.com/schmeekygeek",
                      name: "GitHub",
                      icon: FontAwesomeIcons.github,
                    ),
                    const LinkItem(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.lightBlueAccent,
                      url: "https://twitter.com/schmeekydev",
                      name: "Twitter",
                      icon: FontAwesomeIcons.twitter,
                    ),
                    const LinkItem(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      url:
                          "https://www.linkedin.com/in/abdul-samad-shaikh-57b8b2220/",
                      name: "LinkedIn",
                      icon: FontAwesomeIcons.linkedin,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Made with ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(FontAwesomeIcons.solidHeart,
                            size: 18, color: Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
