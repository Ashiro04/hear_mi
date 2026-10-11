import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_tracks.dart';
import 'tracks_event.dart';
import 'tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  final GetTracks getTracks;

  TracksBloc({required this.getTracks}) : super(const TracksState()) {
    on<TracksRequested>(_onRequested);
  }

  Future<void> _onRequested(
    TracksRequested event,
    Emitter<TracksState> emit,
  ) async {
    emit(state.copyWith(status: TracksStatus.loading));
    final result = await getTracks();
    result.fold(
      (f) =>
          emit(state.copyWith(status: TracksStatus.failure, error: f.message)),
      (tracks) =>
          emit(state.copyWith(status: TracksStatus.success, tracks: tracks)),
    );
  }
}
