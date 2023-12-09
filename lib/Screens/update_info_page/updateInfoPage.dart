import 'package:flutter/material.dart';

class UpdateInformationPage extends StatefulWidget {
  const UpdateInformationPage({Key? key}) : super(key: key);

  @override
  _UpdateInformationPageState createState() => _UpdateInformationPageState();
}

class _UpdateInformationPageState extends State<UpdateInformationPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController pincodeController;

  // Initialize the variables here
  String _name = ''; // Add initial values for your variables
  String _mobileNo = '';
  String _address = '';
  String _city = '';
  String _state = '';
  String _pincode = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: _name);
    mobileController = TextEditingController(text: _mobileNo);
    addressController = TextEditingController(text: _address);
    cityController = TextEditingController(text: _city);
    stateController = TextEditingController(text: _state);
    pincodeController = TextEditingController(text: _pincode);
  }

  @override
  void dispose() {
    // Dispose the controllers to prevent memory leaks
    nameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff07833D),
        title: Text("Update Your Information"),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      onSaved: (value) => _name = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: mobileController,
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      onSaved: (value) => _mobileNo = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile Number is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      onSaved: (value) => _address = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        labelText: 'city',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      onSaved: (value) => _city = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: stateController,
                      decoration: const InputDecoration(
                        labelText: 'State',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      onSaved: (value) => _state = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'State is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: pincodeController,
                      decoration: const InputDecoration(
                        labelText: 'Pincode',
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff07833D)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      onSaved: (value) => _pincode = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pincode is required';
                        }
                        return null;
                      },
                    ),
                    // Add other TextFormField widgets without initialValue...
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // CollectionReference collRef =
                          // FirebaseFirestore.instance.collection('UpdateInformationPage');
                          // await collRef.add({
                          //   'Name': nameController.text,
                          //   'Mobile Number': mobileController.text,
                          //   'Address': addressController.text,
                          //   'City': cityController.text,
                          //   'State': stateController.text,
                          //   'Pincode': pincodeController.text,
                          // });

                          nameController.clear();
                          mobileController.clear();
                          addressController.clear();
                          cityController.clear();
                          stateController.clear();
                          pincodeController.clear();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Information updated')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff07833D), // Background color
                        onPrimary: Colors.white,    // Text color
                        minimumSize: const Size(double.infinity, 50), // Set the minimum button size
                      ),
                      child: const Text("Update Information", style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Image.asset(
          //     'assets/images/bottom_image.png',
          //     height: 250,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Update Information Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UpdateInformationPage(),
    );
  }
}