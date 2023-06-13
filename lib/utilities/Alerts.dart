import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String content;
  List<Widget> actions;
  CustomAlertDialog({
    required this.title,
    required this.content,
    required this.actions,
    Key? key,
  }) : super(key: key);

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: widget.actions,
    );
  }
}
