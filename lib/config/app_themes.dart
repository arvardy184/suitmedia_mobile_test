import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
abstract class AppThemes {
 static const Color primaryColor = Color(0xFF2B637B);
 static const Color borderColor = Color(0xFFE2E3E4);
 static const Color hintTextColor = Color(0x6867775C);
 static const Color listName = Color(0xFF04021D);
 static const Color subListName = Color(0xFF686777);

 static ThemeData get light => ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
       colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
       appBarTheme: const AppBarTheme(
         backgroundColor: Colors.white,
         titleTextStyle: TextStyle(
           color: Colors.black, 
           fontSize: 20,
           fontWeight: FontWeight.w600,
         ),
       ),
       scaffoldBackgroundColor: Colors.white,
       inputDecorationTheme: const InputDecorationTheme(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(12.0)),
           borderSide: BorderSide(color: borderColor),
         ),
         contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 16.0),
         hintStyle: TextStyle(color: hintTextColor),
         fillColor: Colors.white,
         filled: true,
       ),
       listTileTheme: const ListTileThemeData(
         selectedColor: listName,
         textColor: listName, 
         iconColor: listName,
         selectedTileColor: Colors.transparent,
         contentPadding: EdgeInsets.zero,
       ),
       filledButtonTheme: const FilledButtonThemeData(
         style: ButtonStyle(
           shape: WidgetStatePropertyAll(
             RoundedRectangleBorder(
               borderRadius: BorderRadius.all(
                 Radius.circular(12.0),
               ),
             ),
           ),
         ),
       ),
     );
}