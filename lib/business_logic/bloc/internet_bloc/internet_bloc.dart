import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/enums.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription subscription;

  InternetBloc({
    @required this.connectivity,
  }) : super(InternetLoading()) {
    subscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        switch (result) {
          case ConnectivityResult.mobile:
            add(
              InternetConnectedEvent(connectionType: ConnectionType.Mobile),
            );
            break;
          case ConnectivityResult.wifi:
            add(
              InternetConnectedEvent(connectionType: ConnectionType.Wifi),
            );
            break;
          default:
            add(
              InternetDisconnectedEvent(),
            );
            break;
        }
      },
    );
  }
  @override
  Stream<InternetState> mapEventToState(
    InternetEvent event,
  ) async* {
    if (event is InternetConnectedEvent) {
      yield InternetConnected(connectionType: event.connectionType);
    } else if (event is InternetDisconnectedEvent) {
      yield InternetDisconnected();
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
