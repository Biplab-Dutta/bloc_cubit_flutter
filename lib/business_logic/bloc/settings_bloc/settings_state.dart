part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool appNotification;
  final bool emailNotification;
  const SettingsState({
    @required this.appNotification,
    @required this.emailNotification,
  });

  @override
  List<Object> get props => [appNotification, emailNotification];
}
