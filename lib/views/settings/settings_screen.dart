import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kupro/res/app_text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Settings',
                style: AppTextStyle().poppins20Black700,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }
}
