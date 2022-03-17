import 'package:skysoft_app/bloc/base_event_state.dart';

class PingStates extends BaseEventState {}

class PingInitialState extends PingStates {}

class OnLoading extends PingStates {}

class OnError extends PingStates {
  final String message;

  OnError(this.message);
}
