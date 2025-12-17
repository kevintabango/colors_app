import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_theme_app/models/characters_model.dart';

// Debouncer simple
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class HttpView extends StatefulWidget {
  const HttpView({super.key});

  @override
  State<HttpView> createState() => _HttpViewState();
}

class _HttpViewState extends State<HttpView> {
  CharacterModel? character;
  final _debouncer = Debouncer(milliseconds: 200);
  Timer? _timer;
  int currentIndex = 0;

  final List<int> characterIds = [1, 2, 3, 4, 5, 6];

  fetchData(int id) async {
    var url = Uri.https('thesimpsonsapi.com', '/api/characters/$id');
    var response = await http.get(url);
    return characterModelFromJson(response.body);
  }

  @override
  void initState() {
    super.initState();

    // Cargar el primer personaje
    fetchData(characterIds[currentIndex]).then((data) {
      _debouncer.run(() {
        setState(() {
          character = data;
        });
      });
    });

    // Cambiar personaje automáticamente cada 5 segundos
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      currentIndex = (currentIndex + 1) % characterIds.length;
      fetchData(characterIds[currentIndex]).then((data) {
        _debouncer.run(() {
          setState(() {
            character = data;
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        title: const Text(
          'Simpsons Characters',
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Image.asset('assets/img/fondo.png', fit: BoxFit.cover,
        height: 1000,),
      ),
      body: Center(
        child: character == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://cdn.thesimpsonsapi.com/500${character!.portraitPath}',
                    height: 220,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nombre: ${character!.name}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }
}
