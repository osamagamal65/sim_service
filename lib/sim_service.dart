import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'models/sim_data.dart';

class SimService {
  static const MethodChannel _channel = const MethodChannel('sim_service');
  static Future<SimData> get getSimData async {
    try {
    dynamic simData = await _channel.invokeMethod('getSimData');
    var data = json.decode(simData);
    SimData finalSimData = SimData.fromJson(data);
    return finalSimData;
    } on PlatformException catch (e) {
      print('Sim Service faild to retrive sim data $e');
      throw e;
    }
  }
}
