import 'package:equatable/equatable.dart';

import '../../domain/entities/track.dart';

enum TracksStatus { initial, loading, success, failure }

class TracksState extends Equatable {
  final TracksStatus status;
  final List<Track> tracks;
  final String? error;

  const TracksState({
    this.status = TracksStatus.initial,
    this.tracks = const [],
    this.error,
  });

  TracksState copyWith({
    TracksStatus? status,
    List<Track>? tracks,
    String? error,
  }) => TracksState(
    status: status ?? this.status,
    tracks: tracks ?? this.tracks,
    error: error,
  );

  @override
  List<Object?> get props => [status, tracks, error];
}
