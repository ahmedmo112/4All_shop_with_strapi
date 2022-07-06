import 'package:flutter/material.dart';
import 'package:fshop/utils/theme.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({Key? key}) : super(key: key);

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  final List<String> sizelist = ["S", "M", "L", "XL", "XXL"];
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentSelected = index;
            });
          },
          child: Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
                color: currentSelected == index? mainColor.withOpacity(0.5) : Colors.white,
                border:
                    Border.all(
                      color: currentSelected == index?  mainColor : Colors.grey.withOpacity(0.4),
                       width: 2
                       ),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(sizelist[index]),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemCount: sizelist.length,
      ),
    );
  }
}
