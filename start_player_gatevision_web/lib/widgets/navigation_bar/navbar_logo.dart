import 'package:flutter/material.dart';
import 'package:the_basics/main.dart';
import 'package:the_basics/locator.dart';
import 'package:the_basics/services/navigation_service.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        locator<NavigationService>().navigateTo('home');
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
