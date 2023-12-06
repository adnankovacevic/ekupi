import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kupro/res/app_colors.dart';
import 'package:kupro/res/app_text_style.dart';

class SearchView extends StatelessWidget {
  SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(Radius.circular(35))),
      width: MediaQuery.of(context).size.width / 1.4,
      child: Form(
        child: TextFormField(
          style: AppTextStyle().poppins12Black500,
          decoration: InputDecoration(
            hintText: 'Search here',
            hintStyle: AppTextStyle().poppins12Black500,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            prefixIcon: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(CupertinoIcons.search),
            ),
          ),
        ),
      ),
    );
  }
}
