import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final buttonPrimary = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: colors.mainColors['secondary'])
        )
    )
);
final buttonSecondary = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(colors.mainColors['btn_secondary']),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: colors.mainColors['btn_secondary'])
        )
    )
);