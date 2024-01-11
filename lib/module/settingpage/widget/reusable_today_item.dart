// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class ReusableTodayItem extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final Function(
          int index, String label, dynamic value, Map<String, dynamic> item)
      onChanged;

  const ReusableTodayItem({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ReusableTodayItem> createState() => _ReusableTodayItemState();
}

class _ReusableTodayItemState extends State<ReusableTodayItem> {
  int selectedtIndex = 0;
  updateIndex(newIndex) {
    selectedtIndex = newIndex;
    setState(() {});
    var item = widget.items[selectedtIndex];
    var index = selectedtIndex;
    var label = item['label'];
    var value = item['value'];
    widget.onChanged(index, label, value, item);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = widget.items[index];
          bool selected = selectedtIndex == index;
          return InkWell(
            onTap: () {
              updateIndex(index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 13),
              width: 61,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: selected ?   Color.fromARGB(255, 533, 56, 74) : greyColor,
              ),
              child: Center(
                child: Text(
                  item['label'],
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
