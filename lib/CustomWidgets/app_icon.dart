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
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RawMaterialButton(
                  splashColor: Colors.red[400],
                  padding: EdgeInsets.all(5),
                  elevation: 2.0,
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  fillColor: Colors.red[200],
                  child: Image(
                    image: MemoryImage(app.icon),
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {

                      DeviceApps.openApp(app.packageName);
                  },
              ),
            ),
            Expanded(
              child: Text(
                  app.appName,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
