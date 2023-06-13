import 'package:flutter/material.dart';
import 'colors.dart';

Widget primaryButton(double width, {required String title , Function()? onPressed}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xfffd864e),
          Color(0xba362257),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    ),
    constraints: BoxConstraints(minWidth: width),
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // color: MyColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget followStyleButton(double width,
    {required Function() callback, required String title}) {
  return Container(
    constraints: BoxConstraints(minWidth: width),
    child: MaterialButton(
      onPressed: callback,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: MyColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget followingStyleButton(double width,
    {required Function() callback, required String title}) {
  return Container(
    constraints: BoxConstraints(minWidth: width),
    child: MaterialButton(
      onPressed: callback,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
