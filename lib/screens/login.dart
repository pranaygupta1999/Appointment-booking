import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/Locations.dart';

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
    Map<String, String> userBody = {
      "uname": userNameController.text,
      "password": passwordController.text,
    };
    var res =
        await http.post("http://10.100.100.243:3000/login", body: userBody);
    var resBody = jsonDecode(res.body);
    if (res.statusCode == 200) {
      print("succes");
      print(context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AfterLogin(resBody)));
    } else {
      print("Invalid");
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