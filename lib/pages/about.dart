import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                icon: Icon(!context.watch<ThemeModel>().isDark ? Icons.dark_mode_rounded : FontAwesomeIcons.solidLightbulb),
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
                  const Text("DewIT is free and open-source application to manage your tasks well, built using the Flutter framework, by,",
                    textAlign: TextAlign.center,
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 140,
                    width: 140,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        opacity: 0.89,
                        image: AssetImage(
                          "assets/me.jpg"
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        const SizedBox(
                          height: 50
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                            color: context.watch<ThemeModel>().isDark ? Colors.white54 : Colors.black54,
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
                              RotateAnimatedText("ARTIST"),
                              RotateAnimatedText("DESIGNER"),
                              RotateAnimatedText("DEVELOPER"),
                              RotateAnimatedText("WRITER"),
                            ],
                          ),
                      ),]
                    ),
                  ),
                  const Center(
                    child: Text("Abdul Samad Shaikh",
                      style: TextStyle(
                        fontFamily: "Madi",
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Abdul Samad is a self-taught, full-stack developer, based in Mumbai, India\nCheck out their work here:"),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: const Icon(FontAwesomeIcons.github),
                        label: const Text("GitHub"),
                        style: ButtonStyle(
                          foregroundColor: context.watch<ThemeModel>().isDark ? const MaterialStatePropertyAll(Colors.black87) : const MaterialStatePropertyAll(Colors.white),
                          backgroundColor: !context.watch<ThemeModel>().isDark ? const MaterialStatePropertyAll(Colors.black87) : const MaterialStatePropertyAll(Colors.white),
                          fixedSize: const MaterialStatePropertyAll(Size.fromWidth(220)),
                        ),
                        onPressed: () async {
                          const githubUrl = "https://github.com/schmeekygeek";
                          if(await canLaunchUrlString(githubUrl)){
                            await launchUrlString(
                              githubUrl,
                              mode: LaunchMode.externalApplication
                            );
                          }
                        },
                      ),
                      // TextButton.icon(
                      //   icon: const Icon(FontAwesomeIcons.twitter),
                      //   label: const Text("Twitter"),
                      //   style: ButtonStyle(
                      //     foregroundColor: context.watch<ThemeModel>().isDark ? const MaterialStatePropertyAll(Colors.black87) : const MaterialStatePropertyAll(Colors.white),
                      //     fixedSize: const MaterialStatePropertyAll(Size.fromWidth(220)),
                      //   ),
                      //   onPressed: () async {
                      //     const twitterUrl = "https://twitter.com/schmeekydev";
                      //     if(await canLaunchUrlString(twitterUrl)){
                      //       await launchUrlString(
                      //         twitterUrl,
                      //         mode: LaunchMode.externalApplication
                      //       );
                      //     }
                      //   },
                      // ),
                      TextButton.icon(
                        icon: const Icon(FontAwesomeIcons.linkedin, textDirection: TextDirection.ltr),
                        label: const Text("LinkedIn"),
                        style: ButtonStyle(
                          // foregroundColor: MaterialStatePropertyAll(Colors.black87),
                          foregroundColor: context.watch<ThemeModel>().isDark ? const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.white),
                          backgroundColor: !context.watch<ThemeModel>().isDark ? const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.white),
                          fixedSize: const MaterialStatePropertyAll(Size.fromWidth(220)),
                        ),
                        onPressed: () async {
                          const linkedinUrl = "https://www.linkedin.com/in/abdul-samad-shaikh-57b8b2220/";
                          if(await canLaunchUrlString(linkedinUrl)){
                            await launchUrlString(
                              linkedinUrl,
                              mode: LaunchMode.externalApplication
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Made with ", style: TextStyle(color: Colors.grey),),
                          Icon(FontAwesomeIcons.solidHeart, size: 18, color: Colors.redAccent),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
