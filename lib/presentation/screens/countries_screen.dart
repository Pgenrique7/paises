import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CountriesScreen()));

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Countries API')),
        ),
        body: const CountriesView(),
    );
  }
}

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [ 
          Center(
            child: Container(
              child: const Image(image: NetworkImage('https://w7.pngwing.com/pngs/42/302/png-transparent-earth-drawing-earth.png'))
                ),
          )
        ],
      )
    );

  }
}