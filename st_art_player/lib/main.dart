import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:st_art_player/data/join_or_login.dart';
import 'package:st_art_player/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:st_art_player/screens/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:Splash(),
      home:Splash(),
    );
  }
}



class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder < User > (
        stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.data == null) {
        return ChangeNotifierProvider<JoinOrLogin>.value(
            value: JoinOrLogin(),
            child: Authpage());
      }else{
        return MainPage(email: snapshot.data.email);
      }
    }
    );
    }
  }

