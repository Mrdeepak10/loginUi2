import 'package:flutter/material.dart';
import 'package:nextloginui/models.dart';

class HomePage extends StatefulWidget {
  final ProfileModel user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Email : ${widget.user.name}"),
          Text("Password : ${widget.user.password}")
        ],
      ),
    );
  }
}
