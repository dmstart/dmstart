import 'package:flutter/material.dart';
import 'package:the_basics/constants/app_colors.dart';
import 'package:the_basics/services/navigation_service.dart';

import '../../locator.dart';

class CallToActionMobile extends StatelessWidget {
  final String title;

  const CallToActionMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo('login');
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
