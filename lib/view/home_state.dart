import 'package:alert_learn/model/reqres_model.dart';
import 'package:alert_learn/services/reqres_services.dart';
import 'package:flutter/material.dart';

abstract class HomeState<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  List<ReqresModel>? item;
  late final IReqresService reqresService;

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService();
    fetchListItemAdvance();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> fetchListItemAdvance() async {
    changeLoading();
    item = await reqresService.fetchListItemAdvance();
    changeLoading();
  }
}
