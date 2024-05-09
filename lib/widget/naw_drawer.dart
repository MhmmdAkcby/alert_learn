import 'package:alert_learn/product/language/language_item.dart';
import 'package:flutter/material.dart';

class NawDrawer extends StatelessWidget {
  const NawDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: _WidgetColor.drawHeaderColor),
            child: Text(LangaugeItem.imageZoom.languageItemString()),
          ),
          ListTile(onTap: () => Navigator.of(context).pop(), title: Text(LangaugeItem.demo.languageItemString())),
          ListTile(onTap: () => Navigator.of(context).pop(), title: Text(LangaugeItem.demo.languageItemString())),
          ListTile(onTap: () => Navigator.of(context).pop(), title: Text(LangaugeItem.demo.languageItemString())),
        ],
      ),
    );
  }
}

class _WidgetColor {
  static const drawHeaderColor = Color.fromRGBO(225, 190, 231, 1);
}
