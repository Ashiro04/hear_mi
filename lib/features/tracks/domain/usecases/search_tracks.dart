import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/track.dart';
import '../repositories/track_repository.dart';

class SearchTracks implements UseCase<List<Track>, String> {
  final TrackRepository _repo;
  SearchTracks(this._repo);

  @override
  Future<Either<Failure, List<Track>>> call(String query) =>
      _repo.search(query);
}
