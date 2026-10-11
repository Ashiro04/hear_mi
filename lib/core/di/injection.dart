import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../features/tracks/data/datasources/track_datasource.dart';
import '../../features/tracks/data/datasources/track_local_datasource.dart';
import '../../features/tracks/data/datasources/track_mock_datasource.dart';
import '../../features/tracks/data/datasources/track_remote_datasource.dart';
import '../../features/tracks/data/repositories/track_repository_impl.dart';
import '../../features/tracks/domain/repositories/track_repository.dart';
import '../../features/tracks/domain/usecases/get_tracks.dart';
import '../../features/tracks/domain/usecases/search_tracks.dart';
import '../../features/tracks/presentation/bloc/tracks_bloc.dart';
import '../config/app_config.dart';
import '../permissions/media_permission_service.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _registerExternal();
  _registerTracks();
}

void _registerExternal() {
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
      ),
    ),
  );
  sl.registerLazySingleton<OnAudioQuery>(() => OnAudioQuery());
  sl.registerLazySingleton<MediaPermissionService>(
    () => MediaPermissionService(),
  );
}

void _registerTracks() {
  // Seule ligne à changer pour passer du mock à l'API
  sl.registerLazySingleton<TrackDataSource>(
    () => switch (AppConfig.trackSource) {
      DataSourceType.mock => TrackMockDataSource(),
      DataSourceType.local => TrackLocalDataSource(
        sl<OnAudioQuery>(),
        sl<MediaPermissionService>(),
      ),
      DataSourceType.remote => TrackRemoteDataSource(sl<Dio>()),
    },
  );
  sl.registerLazySingleton<TrackRepository>(
    () => TrackRepositoryImpl(sl<TrackDataSource>()),
  );
  sl.registerLazySingleton(() => GetTracks(sl<TrackRepository>()));
  sl.registerLazySingleton(() => SearchTracks(sl<TrackRepository>()));
  sl.registerFactory(() => TracksBloc(getTracks: sl<GetTracks>()));
}
