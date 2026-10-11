// lib/features/tracks/data/repositories/track_repository_impl.dart
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/guard.dart';
import '../../domain/entities/track.dart';
import '../../domain/repositories/track_repository.dart';
import '../datasources/track_datasource.dart';

class TrackRepositoryImpl implements TrackRepository {
  final TrackDataSource _ds;
  TrackRepositoryImpl(this._ds);

  @override
  Future<Either<Failure, List<Track>>> getTracks() =>
      guard(() => _ds.getTracks());

  @override
  Future<Either<Failure, List<Track>>> search(String query) =>
      guard(() => _ds.search(query));
}
