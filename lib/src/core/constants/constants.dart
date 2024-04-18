import 'package:flutter/material.dart';

/// Colours
const backgroundColour = Color(0xff131312);
const appWhiteColour = Color(0xfff2f3f4);
const appGreyColour = Color(0xff161b22);
const appRedColour = Color(0xffca2a33);

/// Regex
RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
