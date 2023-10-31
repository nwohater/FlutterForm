import 'package:flutter/material.dart';

class ScreenForm extends StatefulWidget {
  const ScreenForm({Key? key}) : super(key: key);

  @override
  State<ScreenForm> createState() => _ScreenFormState();
}

class _ScreenFormState extends State<ScreenForm> {

  final _formKey = GlobalKey<FormState>();
  final _items = ['Car', 'Bike', 'Truck'];
  String _selectedItem = 'Car';

  void onChanged(String? newValue) {
    setState(() {
      _selectedItem = newValue.toString();
    });

  }

  void validateForm(){
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView(
            children: [
              const Center(child: Text('Form Screen')),
              Form(
                key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: DropdownButtonFormField<String>(
                              value: _selectedItem, // Set the selected item
                              items: _items.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: onChanged,
                               decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.directions_car),
                                  hintText: 'Select your Vehicle Type',
                                  labelText: 'Vehicle Type',
                                  border: OutlineInputBorder(),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.fire_truck),
                              hintText: 'Enter your Vehicle Number',
                              labelText: 'Vehicle Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter vehicle number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.numbers_outlined),
                              hintText: 'Enter your Vehicle Mileage',
                              labelText: 'Vehicle Mileage',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter vehicle Mileage';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              validateForm();
                            },
                            child: const Text("Submit"))
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

