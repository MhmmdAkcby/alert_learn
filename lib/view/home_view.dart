import 'package:alert_learn/product/language/language_item.dart';
import 'package:alert_learn/view/home_state.dart';
import 'package:alert_learn/widget/alert_mixin_widget.dart';
import 'package:alert_learn/widget/image_zoom_mixn.dart';
import 'package:alert_learn/widget/naw_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeState<HomeView> with AlertMixin, ImageZoomMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NawDrawer(),
        appBar: AppBar(
          title: Text(LangaugeItem.appBarName.languageItemString()),
          actions: const [
            Padding(padding: _WidgetPadding.normalPadding, child: CircleAvatar(child: Icon(Icons.person)))
          ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: item?.length ?? _WidgetSize().zero,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: _showProfileImage(context, index),
                      title: Text(
                          '${item?[index].firstName ?? LangaugeItem.errorMessage.languageItemString()} ${item?[index].lastName ?? LangaugeItem.errorMessage.languageItemString()}'),
                      subtitle: Text(item?[index].email ?? LangaugeItem.errorMessage.languageItemString()),
                      trailing: _deleteButton(context),
                    ),
                  );
                },
              ));
  }

  IconButton _deleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showAlertMixin(context, const _ContentAlert());
      },
      icon: const Icon(Icons.delete),
    );
  }

  InkWell _showProfileImage(BuildContext context, int index) {
    return InkWell(
        onTap: () {
          imageZoom(context, item?[index].avatar ?? LangaugeItem.errorMessage.languageItemString());
        },
        child: CircleAvatar(
            backgroundImage: NetworkImage(item?[index].avatar ?? LangaugeItem.errorMessage.languageItemString())));
  }
}

class _ContentAlert extends StatelessWidget {
  const _ContentAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: Text(LangaugeItem.delete.languageItemString())),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(LangaugeItem.close.languageItemString()))
      ],
    );
  }
}

class _WidgetSize {
  final int zero = 0;
}

class _WidgetPadding {
  static const normalPadding = EdgeInsets.all(8.0);
}
