import 'package:flutter/material.dart';
import '../models/espisodes_list_model.dart';

class EpisodioDetalle extends StatelessWidget {
  final EpisodeModel episode;

  const EpisodioDetalle({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Episodio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            if (episode.imagePath.isNotEmpty)
              Center(
                child: Image.network(
                  episode.imagePath,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 16),

            // Título
            Text(
              episode.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 12),
             // Temporada
            Text(
              'Temporada: ${episode.season}',
              style: Theme.of(context).textTheme.bodyMedium,
          
            ),
               const SizedBox(height: 12),

            // Episodio
            Text(
              'Episodio: ${episode.episodeNumber}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
               const SizedBox(height: 12),

            // Descripción
            Text(
              'Descripción:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              episode.synopsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 12),

           
          ],
        ),
      ),
    );
  }
}
