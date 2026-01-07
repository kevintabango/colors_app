import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';
import 'package:switch_theme_app/services/theme_service.dart';
import 'package:switch_theme_app/views/colors_view.dart';
import 'package:switch_theme_app/views/episodios_view.dart';
import 'package:switch_theme_app/views/http.view.dart';
import 'package:switch_theme_app/views/inputs_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var themeStatus = themeMode.value == 'light';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              'Switch Theme',
              style: TextStyle(fontSize: 22),
            ),

            // Animación Lottie local
            /*Lottie.asset(
              'assets/Loading Lottie animation.json',
              height: 200,
            ),*/

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ColorsView()),
                );
              },
              child: const Text('Go to colors view'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InputsView()),
                );
              },
              child: const Text('Registro de Avión'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HttpView()),
                );
              },
              child: const Text('Vista HTTP - The Simpsons API'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EpisodiosView()),
                );
              },
              child: const Text('Vista Episodios'),
            ),

            // Animación Lottie desde internet
           /* Lottie.network(
              "https://lottie.host/aac96b04-0106-4659-aa32-8d90f34518cb/STTwGBKb5s.json",
              height: 150,
            ),*/
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (themeStatus) {
            themeMode.value = 'dark';
          } else {
            themeMode.value = 'light';
          }
        },
        tooltip: 'Switch theme',
        child: Icon(
          themeStatus ? Icons.sunny : Icons.mode_night_outlined,
        ),
      ),
    );
  }
}
