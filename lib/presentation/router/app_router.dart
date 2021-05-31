import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj1/business_logic/bloc/settings_bloc/settings_bloc.dart';
// import 'package:prj1/business_logic/bloc/counter_bloc.dart';
import 'package:prj1/presentation/screens/screens.dart';
import 'package:prj1/presentation/screens/settings_screen.dart';

class AppRoute {
  // final _bloc = CounterBloc();

  // Route onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case '/':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: _bloc,
  //           child: HomeScreen(
  //             title: 'Home Screen',
  //             color: Colors.blueAccent,
  //           ),
  //         ),
  //       );
  //       break;
  //     case '/second':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: _bloc,
  //           child: SecondScreen(
  //             title: 'Second Screen',
  //             color: Colors.redAccent,
  //           ),
  //         ),
  //       );
  //       break;
  //     case '/third':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: _bloc,
  //           child: ThirdScreen(
  //             title: 'Third Screen',
  //             color: Colors.purpleAccent,
  //           ),
  //         ),
  //       );
  //       break;
  //     default:
  //       return null;
  //   }
  // }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: 'Home Screen',
            color: Colors.blueAccent,
          ),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: 'Second Screen',
            color: Colors.redAccent,
          ),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: 'Third Screen',
            color: Colors.purpleAccent,
          ),
        );
        break;
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SettingsBloc>(
            create: (context) => SettingsBloc(),
            child: SettingsScreen(
              title: 'Settings',
              color: Colors.blueGrey,
            ),
          ),
        );
        break;
      default:
        return null;
    }
  }

  // void dispose() {
  //   _bloc.close();
  // }
}
