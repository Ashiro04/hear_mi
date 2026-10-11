import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/track.dart';
import '../repositories/track_repository.dart';

class GetTracks implements UseCase<List<Track>, NoParams> {
  final TrackRepository _repo;
  GetTracks(this._repo);

  @override
  Future<Either<Failure, List<Track>>> call([
    NoParams params = const NoParams(),
  ]) => _repo.getTracks();
}
