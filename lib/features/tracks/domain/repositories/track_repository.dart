import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/track.dart';

abstract class TrackRepository {
  Future<Either<Failure, List<Track>>> getTracks();
  Future<Either<Failure, List<Track>>> search(String query);
}
