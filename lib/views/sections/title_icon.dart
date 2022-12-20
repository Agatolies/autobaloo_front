import 'package:flutter/material.dart';

class PageSection extends StatelessWidget {
  const PageSection({
    Key? key,
    required this.titleEvent,
    required this.widget,
    this.iconEvent,
    this.iconColor = Colors.deepOrange, //affectation par défaut
  }) : super(key: key);

  final String titleEvent;
  final Widget widget;
  final IconData? iconEvent;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  titleEvent,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(iconEvent, color: iconColor),
              ],
            ),
            widget
          ],
        ));
  }
}
