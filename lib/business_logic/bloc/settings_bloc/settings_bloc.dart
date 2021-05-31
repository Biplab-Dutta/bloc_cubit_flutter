import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsState(appNotification: false, emailNotification: false));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is EmailToggle) {
      yield SettingsState(
          appNotification: state.appNotification,
          emailNotification: !state.emailNotification);
    } else if (event is AppToggle) {
      yield SettingsState(
          appNotification: !state.appNotification,
          emailNotification: state.emailNotification);
    }
  }
}
