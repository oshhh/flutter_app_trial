import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:trialapp/app_icon.dart';

class Home extends StatelessWidget {
  List<String> app_list1 = ['Meet', 'Hangouts', 'Classroom', 'Keep notes'];
  List<String> app_list2 = ['Photos', 'YouTube', 'Drive', 'Maps'];
  List<String> app_list3 = ['Gmail', 'Chrome', 'Lens', 'Google Play Music'];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DeviceApps.getInstalledApplications(includeAppIcons: true, includeSystemApps: true),
        builder: (context, data) {
          Map<String, ApplicationWithIcon> app_map = {};
          for(ApplicationWithIcon app in data.data) {
            app_map[app.appName] = app;
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red[400],
              title: Text("My Custom Google Folder"),
              centerTitle: true,
            ),
            body: Container(
              color: Colors.red[50],
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Image(
                    image: AssetImage('assets/google-logo.png'),
                    height: 200,
                    width: 200,
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: app_list1.map((app) {
                        return AppIcon(app: app_map[app]);
                      } ).toList(),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: app_list2.map((app) {
                        return AppIcon(app: app_map[app]);
                      } ).toList(),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: app_list3.map((app) {
                        return AppIcon(app: app_map[app]);
                      } ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
