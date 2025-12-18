import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_theme_app/models/episodes_list_model.dart';

class EpisodesListView extends StatefulWidget {
  const EpisodesListView({super.key});

  @override
  State<EpisodesListView> createState() => _EpisodesListViewState();
}

class _EpisodesListViewState extends State<EpisodesListView> {
  fetchData() async {
    var url = Uri.https('thesimpsonsapi.com', '/api/episodes?page=1');
    var response = await http.get(url);
    return episodesListModeFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episodes')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('lista de episodios'),
            FutureBuilder(
              future: fetchData(),
              builder: (context, AsyncSnapshot<EpisodesListModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error en la data: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.results
                        .map(
                          (ep) => ListTile(
                            title: Text(ep.name),
                            subtitle: Text(ep.synopsis),
                          ),
                        )
                        .toList(),
                  );
                }

                return Text('No hay datos de episodios');
              },
            ),
          ],
        ),
      ),
    );
  }
}
