import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String model = '';
  String deviceVersion = '';
  String id = '';
  String brand = '';
  String display = '';
  String host = '';
  String realdev = '';
  String finger = '';
  String type = '';

  Future<void> deviceDetial() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          model = build.model;
          deviceVersion = build.version.sdkInt.toString();
          id = build.androidId;
          brand = build.brand;
          display = build.display;
          host = build.host;
          finger=build.fingerprint;
          type=build.type;
          realdev = build.isPhysicalDevice.toString();
        });
      } else if (Platform.isIOS) {
        var ios = await deviceInfoPlugin.iosInfo;
        setState(() {
          model = ios.model;
          deviceVersion = ios.systemVersion;
          realdev = ios.isPhysicalDevice.toString();
        });
      }
    } on PlatformException {
      print("ex");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[200],
        title: Text(
          "device info app",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info),
        backgroundColor: Colors.redAccent[200],
        onPressed: () {
          deviceDetial();
        },
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Model is:-" + model,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "host is:-" + host,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "deviceVersion SDK is:-" + deviceVersion,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "id is:-" + id,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "brand is:-" + brand,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "display is:-" + display,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "realdev is:-" + realdev,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
              "finger is:-" + finger,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 20,),
            Text(
              "type is:-" + type,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
