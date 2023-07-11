import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get  subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,

    )

  );

}

TextStyle get  headingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w600,
      )

  );

}
TextStyle get  titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      )

  );

}TextStyle get  subTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey[600]
      )

  );

}