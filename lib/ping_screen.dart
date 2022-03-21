import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skysoft_app/bloc/ping_events.dart';

import 'bloc/ping_bloc.dart';
import 'bloc/ping_states.dart';

class PingProvider extends StatelessWidget {
  const PingProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PingBloc(),
      child: PingScreen(),
    );
  }
}

class PingScreen extends StatefulWidget {
  const PingScreen({Key? key}) : super(key: key);

  @override
  State<PingScreen> createState() => _PingScreenState();
}

class _PingScreenState extends State<PingScreen> {
  late PingData data;
  late Duration totalResponse;

  late bool isPinged;
  late bool hasEnded;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ping Screen'),
      ),
      body: BlocConsumer<PingBloc, PingStates>(
        builder: (context, state) {
          initData();

          //return buildUi(context, state);
          return Center(
            child: Column(
              children: [
                ElevatedButton(
                  key: ValueKey('ping button'),
                  child: Text('Ping Google'),
                  onPressed: () {
                    BlocProvider.of<PingBloc>(context).add(PingGoogleEvent());
                  },
                ),
                isPinged
                    ? Text(
                        'IP:${data.response!.ip}',
                        key: ValueKey('IP'),
                      )
                    : Container(),
                isPinged ? Text('Time:${data.response!.time}') : Container(),
                hasEnded
                    ? Text('Total Response Time: $totalResponse')
                    : Container()
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  void initData() {
    this.data = BlocProvider.of<PingBloc>(context).data;
    this.hasEnded = BlocProvider.of<PingBloc>(context).hasEnded;
    this.isPinged = BlocProvider.of<PingBloc>(context).isPinged;
    this.totalResponse = BlocProvider.of<PingBloc>(context).totalResponse;
  }
}
