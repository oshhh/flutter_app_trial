import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class AppIcon extends StatelessWidget {
  ApplicationWithIcon app;
  AppIcon({this.app});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          RawMaterialButton(
              splashColor: Colors.red[200],
              padding: EdgeInsets.all(10),
              elevation: 2.0,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              fillColor: Colors.red[200],
              child: Image(
                image: MemoryImage(app.icon),
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
              onPressed: () {

                  DeviceApps.openApp(app.packageName);
              },
          ),
          Text(
              app.appName,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
                letterSpacing: 1,
              ),
          )
        ],
      ),
    );
  }
}
