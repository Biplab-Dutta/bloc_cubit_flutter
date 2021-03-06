part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class EmailToggle extends SettingsEvent {}

class AppToggle extends SettingsEvent {}
