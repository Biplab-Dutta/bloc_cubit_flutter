import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj1/business_logic/bloc/internet_bloc/internet_bloc.dart';

import '../../business_logic/bloc/counter_bloc/counter_bloc.dart';
import '../../core/enums.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.title, this.color});

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //return BlocListener<InternetBloc, InternetState>
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      // body: BlocListener<InternetBloc, InternetState>(
      //   listener: (context, internetState) {
      //     if (internetState is InternetConnected &&
      //         internetState.connectionType == ConnectionType.Mobile) {
      //       context.read<CounterBloc>().add(
      //             IncrementEvent(),
      //           );
      //     } else if (internetState is InternetConnected &&
      //         internetState.connectionType == ConnectionType.Wifi) {
      //       context.read<CounterBloc>().add(
      //             DecrementEvent(),
      //           );
      //     }
      //   },
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                BlocConsumer<CounterBloc, CounterState>(
                  listener: (context, state) {
                    if (state.wasIncremented == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Incremented'),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Decremented'),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state.count.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Builder(
                  builder: (BuildContext context) {
                    final counterState = context.watch<CounterBloc>().state;
                    final internetState = context.watch<InternetBloc>().state;

                    if (internetState is InternetConnected &&
                        internetState.connectionType == ConnectionType.Mobile) {
                      return Text(
                        'Counter: ' +
                            counterState.count.toString() +
                            ', Internet: Mobile',
                      );
                    } else if (internetState is InternetConnected &&
                        internetState.connectionType == ConnectionType.Wifi) {
                      return Text(
                        'Counter: ' +
                            counterState.count.toString() +
                            ', Internet: Wifi',
                      );
                    } else {
                      return Text(
                        'Counter: ' +
                            counterState.count.toString() +
                            ', ' +
                            'Internet: Disconnected',
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Builder(
                  builder: (BuildContext context) {
                    final value =
                        context.select((CounterBloc bloc) => bloc.state.count);
                    return Text(
                      'Counter: $value',
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: Text('${widget.title} #1'),
                      backgroundColor: widget.color,
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(DecrementEvent());
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: Text('${widget.title} #2'),
                      backgroundColor: widget.color,
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementEvent());
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: widget.color,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/second',
                    );
                  },
                  child: Text('Navigate to the second screen.'),
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: widget.color,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/third',
                    );
                  },
                  child: Text('Navigate to the third screen.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
