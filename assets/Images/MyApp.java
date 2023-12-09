import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking App',
      home: TrackingPage(),
    );
  }
}

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/your_image.png', // Replace with your image path
              width: 200,
              height: 200,
              // You can adjust width and height accordingly
            ),
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _startTracking();
              },
              child: Text('Track'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter tracking number',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _startTracking() {
    // TODO: Implement your tracking logic here

    // Simulating tracking steps
    setState(() {
      _currentStep = 0; // Reset to the first step
    });

    // Show the stepper with animation (you can use a package like 'animations' for more complex animations)
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Order Tracking'),
          content: Container(
            width: double.maxFinite,
            child: Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepTapped: (step) {
                // Handle step tapping
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                // Handle continue button tap
                if (_currentStep < 3) {
                  setState(() {
                    _currentStep++;
                  });
                }
              },
              onStepCancel: () {
                // Handle cancel button tap
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
              },
              steps: [
                Step(
                  title: Text('Order Confirmed'),
                  content: Text('Your order has been confirmed.'),
                  isActive: _currentStep >= 0,
                ),
                Step(
                  title: Text('Shipped'),
                  content: Text('Your order has been shipped.'),
                  isActive: _currentStep >= 1,
                ),
                Step(
                  title: Text('Out for Delivery'),
                  content: Text('Your order is out for delivery.'),
                  isActive: _currentStep >= 2,
                ),
                Step(
                  title: Text('Delivered'),
                  content: Text('Your order has been delivered.'),
                  isActive: _currentStep >= 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
