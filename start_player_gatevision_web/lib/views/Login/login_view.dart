import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_basics/provider/page_notifier.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //const LoginView({Key key}) : super(key: key);
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();

  bool isRegister = false;

  Duration _duration = Duration(milliseconds: 300);
  Curve _curve = Curves.fastOutSlowIn;

  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.transparent, width: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            reverse: true,
            padding: EdgeInsets.all(6),
            children: [
            CircleAvatar(
            backgroundColor: Colors.white54,
            radius: 36,
            child: Image.asset('assets/ST_ART_logo.png'),
          ),
          ButtonBar(
            children: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      isRegister = false;
                    });
                  },
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: isRegister
                              ? FontWeight.w400
                              : FontWeight.w600,
                          color: isRegister
                              ? Colors.black45
                              : Colors.black87))),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      isRegister = true;
                    });
                  },
                  child: Text("Register",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: isRegister
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isRegister
                              ? Colors.black87
                              : Colors.black45)))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          _buildTextFormField("Email Address", _emailController),
          SizedBox(
            height: 8,
          ),
          _buildTextFormField("Password", _passwordController),
          SizedBox(
            height: 8,
          ),
          AnimatedContainer(
              height: isRegister ? 60 : 0,
              duration: _duration,
              curve: _curve,
              child: _buildTextFormField(
                  "Confirm Password", _emailController)),
          SizedBox(
            height: 16,
          ),
          Consumer<LoginOrRegister>(
              builder: (context, LoginOrRegister, child) =>
              (
                  FlatButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          print('입력값이 올바름');
                          LoginOrRegister.isLogin?_register(context):_login(context);}
                      },
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(isRegister ? "Register" : "Login"))
              ))
              ].reversed.toList(),
        ),
      ),
    ),);
  }

  TextFormField _buildTextFormField(String labelText,
      TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "write here";
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.black45,
          border: _border,
          errorBorder: _border.copyWith(
              borderSide: BorderSide(color: Colors.black, width: 3)),
          enabledBorder: _border,
          focusedBorder: _border,
          errorStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          labelStyle: TextStyle(color: Colors.white)),
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


}