import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_theme_app/models/character_model.dart';

class HttpView extends StatefulWidget {
  const HttpView({super.key});

  @override
  State<HttpView> createState() => _HttpViewState();
}

class _HttpViewState extends State<HttpView> {
  fetchData() async {
    // https://thesimpsonsapi.com/api/characters/2
    var url = Uri.https('thesimpsonsapi.com', '/api/characters/15');
    var response = await http.get(url);
    return characterModelFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, AsyncSnapshot<CharacterModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading indicator
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
              ); // Display an error message
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://cdn.thesimpsonsapi.com/500${snapshot.data?.portraitPath}',
                    ),
                  ),
                  Text('Data: ${snapshot.data?.name}'),
                ],
              ); // Display the fetched data
            } else {
              return Text('No data'); // Handle cases where no data is available
            }
          },
        ),
      ),
    );
  }
}
