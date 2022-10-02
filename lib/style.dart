import 'package:flutter/material.dart';

class ThemeSelector {

  const ThemeSelector();

  ThemeData buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          letterSpacing: 1,
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 144, 122, 169),
          fontFamily: "Agne",
          fontSize: 25,
          letterSpacing: 2,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: Color.fromARGB(255, 255, 250, 243),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 243),
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
        dense: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20)
          )
        ),
      ),
      dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(
          color: Colors.black87,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontFamily: "Poppins",
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        elevation: 12,
        backgroundColor: Colors.white,
      ),
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 235, 111, 146)),
        checkColor: MaterialStatePropertyAll<Color>(Colors.white),
        // shape: ContinuousRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
          backgroundColor: MaterialStatePropertyAll(Colors.blue[100]),
          foregroundColor: const MaterialStatePropertyAll(Colors.black87),
          textStyle: const MaterialStatePropertyAll(TextStyle(
            color: Colors.black87,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w200,
          )),
        )
      ),
    );
  }

  ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          letterSpacing: 1,
          fontSize: 12,
          color: Colors.white,
          // fontWeight: 
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 224, 222, 244),
        ),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 224, 222, 244),
          fontFamily: "Agne",
          fontSize: 25,
          letterSpacing: 2,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: Color.fromARGB(255, 25, 23, 36),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 25, 23, 36),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 25, 23, 36),
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
      dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: "Poppins",
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        elevation: 12,
        backgroundColor: Color.fromARGB(255, 25, 23, 36),
      ),
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 246, 193, 119)),
        checkColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 82, 79, 103)),
        // shape: ContinuousRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(20)),
        // ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
          backgroundColor: MaterialStatePropertyAll(Colors.blue[500]),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          textStyle: const MaterialStatePropertyAll(TextStyle(
            color: Colors.black87,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w200,
          )),
        )
      ),
    );
  }
}
