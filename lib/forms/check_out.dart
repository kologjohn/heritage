import 'package:flutter/material.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final formskey=GlobalKey<FormState>();
  bool validator(){
    return formskey.currentState!.validate();

  }

  String _selectedCountry = 'Ghana'; // Default country
  String _selectedRegion = 'Accra'; // Default region for Ghana

  List<String> _regionsForGhana = [
    'Accra',
    'Kumasi',
    'Tamale',
    'Cape Coast',
    // Add more regions for Ghana here
  ];

  Map<String, List<String>> _regionsByCountry = {
    'Ghana': ['Accra', 'Kumasi', 'Tamale', 'Cape Coast'],
    // Add more countries and their regions here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Checkout Form'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 550,
              maxHeight: 800
          ),
          child: Card(
            elevation: 3,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formskey,
                    child: ListView(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'First Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Last Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedCountry,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCountry = value!;
                                    _selectedRegion = _regionsByCountry[value]![0];
                                  });
                                },
                                items: _regionsByCountry.keys.map((String country) {
                                  return DropdownMenuItem<String>(
                                    value: country,
                                    child: Text(country),
                                  );
                                }).toList(),
                                decoration: InputDecoration(labelText: 'Country'),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedRegion,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRegion = value!;
                                  });
                                },
                                items: _regionsByCountry[_selectedCountry]!.map((String region) {
                                  return DropdownMenuItem<String>(
                                    value: region,
                                    child: Text(region),
                                  );
                                }).toList(),
                                decoration: InputDecoration(labelText: 'Region'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Street Address'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your street address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Town/City'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your town/city';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Postcode/ZIP'),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Phone'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            // Add your form submission logic here
                          },
                          child: Text('Place Order'),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}