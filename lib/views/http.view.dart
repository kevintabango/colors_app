import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_theme_app/models/characters_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Función que devuelve el modelo completo
  Future<CharacterModel> fetchData() async {
    var url = Uri.https('thesimpsonsapi.com', 'api/characters/5');
    var response = await http.get(url);
    return characterModelFromJson(response.body); // <-- retorna modelo completo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simpsons Character")),
      body: Center(
        child: FutureBuilder<CharacterModel>(
          future: fetchData(), // Retorna CharacterModel
          builder: (BuildContext context, AsyncSnapshot<CharacterModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Image.network("https://cdn.thesimpsonsapi.com/500${snapshot.data?.portraitPath}"),
                    Text('Nombre: ${snapshot.data!.name}')],
              
              );
              // Extraemos solo el nombre del modelo
               
            } else {
              return const Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
