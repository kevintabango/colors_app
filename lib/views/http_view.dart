import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_theme_app/models/character_model.dart';

class HttpView extends StatefulWidget {
  const HttpView({super.key});

  @override
  State<HttpView> createState() => _HttpViewState();
}

class _HttpViewState extends State<HttpView> {
  late TextEditingController textIdCharacterController;
  String? idChar;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textIdCharacterController = TextEditingController();
  }

  @override
  void dispose() {
    textIdCharacterController.dispose();
    super.dispose();
  }

  fetchData(String? stringId) async {
    if (stringId == null) return null;
    var url = Uri.https('thesimpsonsapi.com', '/api/characters/$stringId');
    var response = await http.get(url);
    return characterModelFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder(
              future: fetchData(idChar),
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
                  return Text(
                    'No data',
                  ); // Handle cases where no data is available
                }
              },
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: textIdCharacterController,
                  decoration: InputDecoration(label: Text('Id')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Para continuar ingrese el id del personaje';
                    }
                    // si ingreso letras, mostrar mensaje
                    final RegExp nRegExp = RegExp(r'^[0-9]+$');
                    if (!nRegExp.hasMatch(value)) {
                      return 'Solo se aceptan números';
                    }
                    if (int.parse(value) > 1183) {
                      return 'El límite es máximo 1183';
                    }
                    if (int.parse(value) <= 0) {
                      return 'Se aceptan valores positivos';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        idChar = textIdCharacterController.text;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Buscando personaje...')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ha ocurrido un error, revise el formulario',
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Buscar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
