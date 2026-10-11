import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'failures.dart';

/// Évite de répéter try/catch dans chaque repository.
Future<Either<Failure, T>> guard<T>(Future<T> Function() action) async {
  try {
    return Right(await action());
  } on DioException catch (e) {
    return Left(NetworkFailure(e.message ?? 'Erreur réseau'));
  } catch (e) {
    return Left(UnexpectedFailure(e.toString()));
  }
}
