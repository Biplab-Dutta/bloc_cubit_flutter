import 'package:flutter/material.dart';
import 'package:prj1/business_logic/bloc/settings_bloc/settings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  final String title;
  final Color color;

  const SettingsScreen({this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: color,
        ),
        body: BlocConsumer<SettingsBloc, SettingsState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'App: ${state.appNotification}, ' +
                      'Email: ${state.emailNotification}',
                ),
                duration: Duration(milliseconds: 600),
              ),
            );
          },
          builder: (context, state) {
            return Container(
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    title: Text('App Notifications'),
                    onChanged: (_) {
                      context.read<SettingsBloc>().add(AppToggle());
                    },
                    value: state.appNotification,
                  ),
                  SwitchListTile(
                    title: Text('Email Notifications'),
                    onChanged: (_) {
                      context.read<SettingsBloc>().add(EmailToggle());
                    },
                    value: state.emailNotification,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
