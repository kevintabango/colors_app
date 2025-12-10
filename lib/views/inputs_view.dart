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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text('Modelo de Avión'),
                border: const OutlineInputBorder(),
                focusColor: Theme.of(context).colorScheme.inversePrimary,
                helperText: "Es necesario este campo",
                hintText: 'Ej. Airbus A320',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text('Matrícula'),
                border: const OutlineInputBorder(),
                focusColor: Theme.of(context).colorScheme.inversePrimary,
                helperText: "Es necesario este campo",
                hintText: 'Ej. N3794N',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text('Año de Fabricación'),
                border: const OutlineInputBorder(),
                focusColor: Theme.of(context).colorScheme.inversePrimary,
                helperText: "Es necesario este campo",
                hintText: 'Ej. 2009',
              ),
            ),
          ),
                SizedBox(height: 8.0),
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
            onChanged: (value) {
              print(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Piloto automático:", style: TextStyle(fontSize: 16)),

                Row(
                  children: [
                    Text("Sí"),
                    Checkbox(
                      value: pilotoAutomatico == true,
                      onChanged: (value) {
                        setState(() => pilotoAutomatico = true);
                      },
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text("No"),
                    Checkbox(
                      value: pilotoAutomatico == false,
                      onChanged: (value) {
                        setState(() => pilotoAutomatico = false);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Horas de Vuelo:", style: TextStyle(fontSize: 16)),
  
            Slider(
            value: sliderValue,
            min: 0,
            max: 50,
            label: sliderValue.round().toString(),
            onChanged: (value) {
          setState(() {
            sliderValue = value; // actualizar el estado
          });
        },
      ),
      Text("Valor seleccionado: ${sliderValue.toStringAsFixed(1)}"),
    ],
            ),
                
          ),
         SwitchListTile(
            value: switchValue,
            title: Text('Primer vuelo:'),
            onChanged: (value) {
              setState(() {
                switchValue = !switchValue;
              });
            },
          ),
          SizedBox(height: 50),
        ElevatedButton(onPressed: () {}, child: Text('Registrar Avión')),
        
        ],
      
      ),
        
    );
  }
}
