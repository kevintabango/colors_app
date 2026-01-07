import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_theme_app/models/espisodes_list_model.dart';
import 'package:switch_theme_app/widgets/episodio_detalle.dart';

class EpisodiosView extends StatefulWidget {
  const EpisodiosView({super.key});

  @override
  State<EpisodiosView> createState() => _EpisodesListViewState();
}

class _EpisodesListViewState extends State<EpisodiosView> {
  int currentPage = 1;
  int pageEpisodios = 0;
  bool masPaginas = true;
  bool ultimaPagina = false;
  static const int pageSize = 20;
  Future<EpisodesListModel> fetchData() async {
    var url = Uri.https('thesimpsonsapi.com', '/api/episodes', {
      'page': currentPage.toString(),
    });

    final response = await http.get(url);
    final data = episodesListModeFromJson(response.body);

    pageEpisodios = data.results.length;
    ultimaPagina = pageEpisodios < pageSize;

    return data;
  }

  String get episodeRangeTitle {
    if (pageEpisodios == 0) return 'Episodios';

    final start = ((currentPage - 1) * pageSize) + 1;
    final end = start + pageEpisodios - 1;

    return 'Episodios $start - $end';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episodes')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(episodeRangeTitle),
            FutureBuilder(
              future: fetchData(),
              builder: (context, AsyncSnapshot<EpisodesListModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Error en la data: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ...snapshot.data!.results
                          .map(
                            (EpisodeModel ep) => ListTile(
                              title: Text(ep.name),
                              subtitle: Text(ep.synopsis),

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        EpisodioDetalle(episode: ep),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),

                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: currentPage > 1
                                  ? () {
                                      setState(() {
                                        currentPage--;
                                      });
                                    }
                                  : null,
                              child: const Text('Anterior'),
                            ),
                            ElevatedButton(
                              onPressed: ultimaPagina
                                  ? null
                                  : () {
                                      setState(() {
                                        currentPage++;
                                      });
                                    },
                              child: const Text('Siguiente'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox(); 
              },
            ),
          ],
        ),
      ),
    );
  }
}
