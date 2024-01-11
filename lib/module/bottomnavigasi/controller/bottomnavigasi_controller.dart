import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';
import '../view/bottomnavigasi_view.dart';

class BottomnavigasiController extends State<BottomnavigasiView> {
  static late BottomnavigasiController instance;
  late BottomnavigasiView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int currentIndex = 0;

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
