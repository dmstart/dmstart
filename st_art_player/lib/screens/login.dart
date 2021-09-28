import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:st_art_player/data/join_or_login.dart';
import 'package:st_art_player/helper/login_background.dart';
import 'package:provider/provider.dart';
import 'package:st_art_player/screens/forget_pw.dart';
import 'package:st_art_player/screens/main_page.dart';

class Authpage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackgorund(
                isJoin: Provider.of<JoinOrLogin>(context).isJoin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Consumer<JoinOrLogin>(
                builder: (context, joinOrLogin, child) => GestureDetector(
                    onTap: () {
                      joinOrLogin.toggle();
                    },
                    child: Text(
                        joinOrLogin.isJoin ? "Player Mode" : "Manager Mode")),
              ),
              Container(
                height: size.height * 0.05,
              ),
              Text("© 2021. ST_ART Inc. all rights reserved.",
                  textAlign: TextAlign.right),
            ],
          ),
        ],
      ),
    );
  }

  void _register(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later.'),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  void _login(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later.'),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Image.asset(
              "assets/gatevision_logo.png",
              width: 400,
              height: 200,
              scale: 0.5,
            ),
          ),
        ),
      );

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: Consumer<JoinOrLogin>(
          builder: (context, joinOrLogin, child) => RaisedButton(
              child: Text(
                joinOrLogin.isJoin ? "Player Login" : "Manager Login",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              color: joinOrLogin.isJoin ? Colors.blue : Colors.yellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  joinOrLogin.isJoin?_register(context):_login(context);
                }
              }),
        ),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Email",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Email.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "Password",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct password.";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Consumer<JoinOrLogin>(
                  builder: (context, value, child) => Opacity(
                      opacity: value.isJoin ? 1 : 0,
                      child: GestureDetector(
                          onTap:value.isJoin?(){goToForgetPw(context);}:null,
                          child: Text("Forgot Password"))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    }
  goToForgetPw(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPw()));
  }

}
