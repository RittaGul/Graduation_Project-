import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/Themes.dart';

class TextFaildSearth extends StatelessWidget {
  String title;
  TextEditingController textEditingController;
  void Function()? onPressedSearch;
  void Function()? onPressedIcon;
  TextFaildSearth({
    required this.title,
    required this.textEditingController,
    required this.onPressedSearch,
    required this.onPressedIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(.1),
              hintText: '$title',
              hintStyle: Themes().headLine1.copyWith(
                    fontSize: 20,
                    color: Colors.black.withOpacity(.6),
                  ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search_outlined),
                onPressed: onPressedSearch,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressedIcon,
          child: Container(
            height: 70,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 92, 47),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.tune_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
