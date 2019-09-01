import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sim_service/sim_service.dart';
import 'package:sim_service/models/sim_data.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SimData _simData;
  bool gettingData = false;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    SimData simData;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      setState(() {
        gettingData = true; 
      });
      simData = await SimService.getSimData;
    } on PlatformException {
      print(simData);
    }
    print(simData.carrierName);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      gettingData = false;
      _simData = simData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: _simData != null && _simData.cards is List && _simData.cards.length > 0 ? _simData.cards.map((SimCard card) {
                      return Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text('the main sim card is ${_simData.carrierName}'),
                              Text(card.carrierName.toString()),
                              Text(card.displayName.toString()),
                              Text(card.countryCode.toString()),
                              Text(card.deviceId.toString()),
                              Text('data roaming is ${card.isDataRoaming}')
                            ],
                          ),
                        ),
                      );
                    }).toList() : gettingData ? [
                      Center(child: CircularProgressIndicator(),
                      )
                    ] : [
                      Center(
                        child: Text('faild to laod data'),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
