import 'package:flutter/material.dart';

import '../models/User.dart';
import './home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void authenticate() async {

      var uname =  userNameController.text;
      var password =  passwordController.text;

    try {
      User user = await User.login(uname, password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen(user)));
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    var radiusBorder = OutlineInputBorder(
        borderSide: BorderSide(width: 2),
        borderRadius: BorderRadius.all(Radius.circular(35)));
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: userNameController,
            decoration: InputDecoration(
              border: radiusBorder,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration:
                InputDecoration(border: radiusBorder, hintText: "Password"),
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
              minWidth: 500,
              color: Colors.green,
              shape: StadiumBorder(),
              onPressed: () {
                authenticate();
              },
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
        ],
      ),
    ));
  }
}