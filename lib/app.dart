import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // initialBinding: GeneralBindings(),
      home: const Scaffold(
        body: Center(
          child: Text('Awesome! 🎊 Project Structure is set up and running. \n Happy T Coding 🎊', textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
