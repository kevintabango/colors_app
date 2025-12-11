import 'package:flutter/material.dart';

class InputsView extends StatefulWidget {
  const InputsView({super.key});

  @override
  State<InputsView> createState() => _InputsViewState();
}

class _InputsViewState extends State<InputsView> {
  bool? checkboxValue = false;
  bool switchValue = false;
  double sliderValue = 0;

  final textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Inputs View'),
      ),
      body: Column(
        // text field
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: textCtrl,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
                focusColor: Theme.of(context).colorScheme.inversePrimary,
                helperText: "It's necesary your full name",
                hintText: 'John Doe',
              ),
            ),
          ),

          // checkbox
          Checkbox.adaptive(
            value: checkboxValue,
            onChanged: (value) {
              setState(() {
                checkboxValue = value;
              });
            },
          ),
          CheckboxListTile.adaptive(
            value: checkboxValue,
            title: Text('Check me'),
            onChanged: (value) {
              setState(() {
                checkboxValue = value;
              });
            },
          ),
          Switch.adaptive(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = !switchValue;
              });
            },
          ),
          SwitchListTile.adaptive(
            value: switchValue,
            title: Text('Switch me'),
            onChanged: (value) {
              setState(() {
                switchValue = !switchValue;
              });
            },
          ),
          Slider.adaptive(
            value: sliderValue,
            min: 0,
            max: 0.5,
            label: "Slide me",

            onChanged: (value) {
              setState(() {
                sliderValue = value;
                print(value);
              });
            },
          ),
          SizedBox(height: 50),
          ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
          FilledButton(onPressed: () {}, child: Text("Filled Button")),
          TextButton(onPressed: () {}, child: Text('Text Button')),
          OutlinedButton(
            onPressed: () {
              print(
                "${textCtrl.text} $checkboxValue $sliderValue $switchValue",
              );
            },
            child: Text('Outline Button'),
          ),
          CloseButton(),
          BackButton(),
        ],
      ),
    );
  }
}
