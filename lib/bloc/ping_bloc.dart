import 'package:dart_ping/dart_ping.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skysoft_app/bloc/ping_events.dart';
import 'package:skysoft_app/bloc/ping_states.dart';

class PingBloc extends Bloc<PingEvents, PingStates> {
  bool isPinged = false;

  PingData data = PingData();

  bool hasEnded = false;

  Duration totalResponse = Duration();

  PingBloc() : super(PingInitialState());

  @override
  Stream<PingStates> mapEventToState(PingEvents event) async* {
    yield OnLoading();
    if (event is PingGoogleEvent) {
      // Create ping object with desired args
      final ping = Ping(
        'google.com',
        count: 5,
      );

      // Begin ping process and listen for output
      ping.stream.listen((event) {
        this.data = event;
        isPinged = true;
        // print(event.response!.time!);

        if (event.response == null) {
          isPinged = false;
          hasEnded = true;
        }
        if (event.response != null) {
          this.totalResponse = this.totalResponse + event.response!.time!;
        }

        add(NewPingEvent());
      });
    }

    if (event is NewPingEvent) {
      yield PingInitialState();
    }
  }
}
