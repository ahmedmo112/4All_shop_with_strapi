import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:fshop/utils/theme.dart';

import 'icon_widget.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconWidget(
          color: languageSettings,
          icon: Icon(
            Icons.language,
            color: Colors.white,
          ),
          text: "Language",
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: en,
                items: [
                  DropdownMenuItem(child: Text(english),value: en,),
                  DropdownMenuItem(child: Text(arabic),value: ar,),
                ],
                onChanged: (value) {
                  en =value!;
                },
              ),
            )),
      ],
    );
  }
}
