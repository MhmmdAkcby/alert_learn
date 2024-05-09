import 'package:alert_learn/product/language/language_item.dart';
import 'package:flutter/material.dart';

mixin AlertMixin {
  Future<T?> showAlertMixin<T>(BuildContext context, Widget child) {
    return showDialog(
      context: context,
      builder: (context) {
        return _AlertWidget(child: child);
      },
    );
  }
}

class _AlertWidget extends StatelessWidget {
  const _AlertWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LangaugeItem.alertMessage.languageItemString()),
      actions: [child],
    );
  }
}
