import 'package:flutter/material.dart';
import 'package:nextloginui/models.dart';
import 'package:nextloginui/utility.dart';

class HomePage extends StatefulWidget {
  final ProfileModel user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    passwordController.text = '${widget.user.password}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, passwordController.text);
        return true;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email : ${widget.user.name}"),
            // Text("Password : ${widget.user.password}"),
            passwordTextWidget()
          ],
        ),
      ),
    );
  }

  Widget passwordTextWidget() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Color(0xff486da1), borderRadius: BorderRadius.circular(0)),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Utility.iconColor,
              ),
              child: Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
            labelText: "Password",
            labelStyle:
                TextStyle(color: Colors.white, fontFamily: "RobotoSlab")),
        // onChanged: (value) {
        //   setState(() {
        //     passwordController.text = value;
        //   });
        // },
      ),
    );
  }
}
