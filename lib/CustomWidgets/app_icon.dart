import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/painting.dart';

class AppIcon extends StatelessWidget {
  ApplicationWithIcon app;
  AppIcon({this.app});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(25, 5, 25, 5),
        color: Colors.blue[100],
        child: ListTile(
            onTap: () => DeviceApps.openApp(app.packageName),
            leading: Expanded(
              child: Image(
                image: MemoryImage(app.icon),
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            title: Text(
                  app.appName,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
              ),
        )
      ),
    );
  }
}
