import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:trialapp/CustomWidgets/app_icon.dart';

class Home extends StatelessWidget {
  List<ApplicationWithIcon> apps = [];

  @override
  Widget build(BuildContext context) {
    apps = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("My Custom Google Folder"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Image(
              image: AssetImage('assets/google-logo.png'),
              height: 100,
              width: 100,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Access all Google apps from one place!",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Quicksand",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                  children: apps.map((app) {
                    return AppIcon(app: app);
                  }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
