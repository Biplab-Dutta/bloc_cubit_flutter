import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:prj1/business_logic/bloc/settings_bloc/settings_bloc.dart';

import 'business_logic/bloc/counter_bloc/counter_bloc.dart';
import 'business_logic/bloc/internet_bloc/internet_bloc.dart';
import 'presentation/router/app_router.dart';

void main() {
  runApp(
    MyApp(
      appRoute: AppRoute(),
      connectivity: Connectivity(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  final Connectivity connectivity;

  const MyApp({
    Key key,
    @required this.appRoute,
    @required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(connectivity: connectivity),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }

  // @override
  // void dispose() {
  //   _appRoute.dispose();
  //   super.dispose();
  // }
}
