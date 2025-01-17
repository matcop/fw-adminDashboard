import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) {

    //los layouts tienen un Scafold
    //aqui se podria realizar otro tipo de verificaciones o procesos.
    return const Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 30,),
            Text('Checking...')
          ],
        ),
      ),
    );
  }
}