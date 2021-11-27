import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextloginui/utility.dart';
import 'models.dart';
import 'home_page.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff97738B),
        body: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            stackWidget(),
          ],
        ),
      ),
    );
  }

  Widget emailIdTextWidget() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xff486da1), borderRadius: BorderRadius.circular(0)),
      child: TextFormField(
        controller: emailIdController,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Utility.iconColor),
              child: Icon(Icons.person, color: Colors.white),
            ),
            labelText: "Email ID",
            labelStyle:
                TextStyle(color: Colors.white, fontFamily: "LobsterTwo")),
        // onChanged: (value) {
        //   setState(() {
        //     print(value);
        //     emailIdController.text = value;
        //   });
        // },
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

  Widget reminderForgetWidget() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Row(
            children: [
              Icon(
                Icons.check_box,
                size: 15,
                color: Utility.iconColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  "Reminder me",
                  style: TextStyle(color: Utility.iconColor),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            "Forget password ?",
            style: TextStyle(
                color: Utility.iconColor, fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }

  Widget circleAvatarWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          backgroundColor: Utility.iconColor,
          radius: 40,
          child: Center(child: Icon(Icons.person_outline_outlined, size: 60)),
        ),
      ),
    );
  }

  Widget loginButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 48,
          width: 220,
          child: Center(
              child: GestureDetector(
            onTap: () async {
              passwordController.text = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    user: ProfileModel(
                        name: emailIdController.text,
                        password: passwordController.text),
                  ),
                ),
              );
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(13)),
        )
      ],
    );
  }

  Widget stackWidget() {
    return Stack(
      children: [
        Container(
          height: 340,
          width: 400,
          child: loginButtonWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Center(
            child: Container(
              height: 260,
              width: 300,
              // color: Colors.white,
              // decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(50)),
              child: Card(
                elevation: 7,
                color: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      emailIdTextWidget(),
                      passwordTextWidget(),
                      reminderForgetWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        circleAvatarWidget(),
      ],
    );
  }
}
