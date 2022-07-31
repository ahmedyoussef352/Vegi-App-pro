// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:connectivity/connectivity.dart';

enum NetworkStatus { Online, Offline }

class NetworkService {
  StreamController<NetworkStatus> controller = StreamController();

  NetworkService() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event));
    });
  }

  NetworkStatus _networkStatus(ConnectivityResult connectivityResult) {
    return connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi
        ? NetworkStatus.Online
        : NetworkStatus.Offline;
  }
}
