import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Set<String> googleApps = {'Chrome', 'Gmail', 'Hangouts', 'Meet'};
  void getAppData() async {
    Map<String, ApplicationWithIcon> apps;
    List<ApplicationWithIcon> allApps = await DeviceApps.getInstalledApplications(includeSystemApps: true, includeAppIcons: true);
    for(ApplicationWithIcon app in allApps) {
      if(googleApps.contains(app.appName)) {
        apps[app.appName] = app;
      }
    }
    print(apps);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
