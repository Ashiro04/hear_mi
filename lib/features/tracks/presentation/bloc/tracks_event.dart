import 'package:equatable/equatable.dart';

abstract class TracksEvent extends Equatable {
  const TracksEvent();
  @override
  List<Object?> get props => [];
}

class TracksRequested extends TracksEvent {
  const TracksRequested();
}
