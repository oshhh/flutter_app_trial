import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/services.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Set<String> googleApps = {'Chrome', 'Youtube', 'Maps', 'Gmail', 'Hangouts', 'Meet', 'Duo', 'Drive', 'Calendar', 'Docs', 'Sheets', 'Slides', 'Photos', 'Keep'};
  List<ApplicationWithIcon> apps = [];
  void getAppData() async {
    List<Application> allApps = await DeviceApps.getInstalledApplications(includeSystemApps: true, includeAppIcons: true);
    for(ApplicationWithIcon app in allApps) {
      if(googleApps.contains(app.appName)) {
        apps.add(app);
      }
    }
    print(apps);
    Navigator.pushReplacementNamed(context, '/home', arguments: apps);

  }


  @override
  void initState() {
    getAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('My Custom Google Folder'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/loading.gif', width: 400, height: 100,),
              Text('Loading', style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
