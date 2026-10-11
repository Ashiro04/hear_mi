import '../models/track_model.dart';

abstract class TrackDataSource {
  Future<List<TrackModel>> getTracks();
  Future<List<TrackModel>> search(String query);
}
