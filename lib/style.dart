import 'package:flutter/material.dart';

class ThemeSelector {

  const ThemeSelector();

  ThemeData buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 144, 122, 169),
          fontFamily: "Poppins",
          fontSize: 25,
          letterSpacing: 9,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: Color.fromARGB(255, 255, 250, 243),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 243),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll<double>(5),
          side: MaterialStatePropertyAll<BorderSide>(
            BorderSide(
              strokeAlign: StrokeAlign.center,
              style: BorderStyle.solid,
              color: Color.fromARGB(255, 144, 122, 169),
              width: 1,
            ),
          ),
          shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
          foregroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 180, 99, 122)),
          backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 250, 244, 237)),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              color: Colors.black87
            )
          )
        )
      ),
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
        dense: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20)
          )
        ),
      ),
    );
  }

  ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 224, 222, 244),
        ),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 224, 222, 244),
          fontFamily: "Poppins",
          fontSize: 25,
          letterSpacing: 9,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: Color.fromARGB(255, 25, 23, 36),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 25, 23, 36),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 25, 23, 36),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(

          side: MaterialStatePropertyAll<BorderSide>(
            BorderSide(
              strokeAlign: StrokeAlign.center,
              style: BorderStyle.solid,
              color: Color.fromARGB(255, 144, 122, 169),
              width: 1,
            ),
          ),
          elevation: MaterialStatePropertyAll<double>(4),
          shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
          foregroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 224, 222, 244)),
          backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 38, 35, 58)),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              color: Color.fromARGB(255, 224, 222, 244)
            )
          )
        )
      ),
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
        dense: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          )
        ),
      ),
    );
  }
}
