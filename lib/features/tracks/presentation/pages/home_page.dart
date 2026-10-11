import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/track_tile.dart';
import '../bloc/tracks_bloc.dart';
import '../bloc/tracks_event.dart';
import '../bloc/tracks_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HEAR-Mi')),
      body: BlocBuilder<TracksBloc, TracksState>(
        builder: (context, state) {
          switch (state.status) {
            case TracksStatus.initial:
            case TracksStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TracksStatus.failure:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.error ?? 'Erreur'),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => context.read<TracksBloc>().add(
                        const TracksRequested(),
                      ),
                      child: const Text('Réessayer'),
                    ),
                  ],
                ),
              );
            case TracksStatus.success:
              return RefreshIndicator(
                onRefresh: () async =>
                    context.read<TracksBloc>().add(const TracksRequested()),
                child: ListView.builder(
                  itemCount: state.tracks.length,
                  itemBuilder: (_, i) => TrackTile(
                    track: state.tracks[i],
                    onTap: () {}, // TODO étape F : lancer la lecture
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
