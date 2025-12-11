import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:switch_theme_app/services/theme_service.dart';
import 'package:switch_theme_app/views/colors_view.dart';
import 'package:switch_theme_app/views/http_view.dart';
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
            const Text('Switch Theme'),
            Lottie.asset('assets/cat.json'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ColorsView()));
              },
              child: Text('Go to colors view'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => InputsView()));
              },
              child: Text('Go to inputs view'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => HttpView()));
              },
              child: Text('Go to http'),
            ),
            Lottie.network(
              'https://lottie.host/f0ef8aa9-d57a-460d-94b5-fb86c7b5db9c/f1gQGUkVMz.json',
            ),
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
        ), //Icons.sunny
        //child: const Icon(Icons.mode_night_outlined), //Icons.sunny
      ),
    );
  }
}
