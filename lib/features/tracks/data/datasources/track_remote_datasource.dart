import 'package:dio/dio.dart';

import '../models/track_model.dart';
import 'track_datasource.dart';

class TrackRemoteDataSource implements TrackDataSource {
  final Dio _dio;
  TrackRemoteDataSource(this._dio);

  @override
  Future<List<TrackModel>> getTracks() async {
    final res = await _dio.get('/api/tracks');
    return _parse(res.data);
  }

  @override
  Future<List<TrackModel>> search(String query) async {
    final res = await _dio.get(
      '/api/tracks/search',
      queryParameters: {'q': query},
    );
    return _parse(res.data);
  }

  List<TrackModel> _parse(dynamic data) => (data as List)
      .map((e) => TrackModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
