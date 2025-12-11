import 'package:flutter/material.dart';

class InputsView extends StatefulWidget {
  const InputsView({super.key});

  @override
  State<InputsView> createState() => _InputsViewState();
}

class _InputsViewState extends State<InputsView> {
  bool? pilotoAutomatico;
  bool? checkboxValue = false;
  bool switchValue = false;
  double sliderValue = 0;

  final textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Image.network(
              'https://www.shutterstock.com/image-vector/airplane-passenger-travel-silhouette-icon-260nw-2473256763.jpg',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text("Registro de Avión"),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                label: const Text('Modelo de Avión'),
                border: const OutlineInputBorder(),
                helperText: "Es necesario este campo",
                hintText: 'Ej. Airbus A320',
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                label: const Text('Matrícula'),
                border: const OutlineInputBorder(),
                helperText: "Es necesario este campo",
                hintText: 'Ej. N3794N',
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                label: const Text('Año de Fabricación'),
                border: const OutlineInputBorder(),
                helperText: "Es necesario este campo",
                hintText: 'Ej. 2009',
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Seleccione Tipo de avión",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: '1', child: Text('De carga')),
                DropdownMenuItem(value: '2', child: Text('Privado')),
                DropdownMenuItem(value: '3', child: Text('Comercial')),
              ],
              onChanged: (value) {},
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Piloto automático:", style: TextStyle(fontSize: 16)),

                Row(
                  children: [
                    const Text("Sí"),
                    Checkbox(
                      value: pilotoAutomatico == true,
                      onChanged: (v) => setState(() => pilotoAutomatico = true),
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Text("No"),
                    Checkbox(
                      value: pilotoAutomatico == false,
                      onChanged: (v) => setState(() => pilotoAutomatico = false),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Horas de Vuelo:", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Slider(
                    value: sliderValue,
                    min: 0,
                    max: 50,
                    onChanged: (value) {
                      setState(() => sliderValue = value);
                    },
                  ),
                ),
              ],
            ),

            SwitchListTile(
              value: switchValue,
              title: const Text('Primer vuelo:'),
              onChanged: (value) => setState(() => switchValue = value),
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Registrar Avión'),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
