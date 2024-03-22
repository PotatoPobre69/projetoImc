import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 27, 153, 170)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'CALCULE SEU IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = "Seu IMC é: ";
  void calcular() {
      double altura = double.parse(alturaController.text);
      double peso = double.parse(pesoController.text);
      double imc = peso / (altura*altura);

      setState(() {
        resultado = "Seu IMC é: ${imc.toString()}";
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: GoogleFonts.zillaSlab(fontSize: 24, fontWeight: FontWeight.w900)),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 189, 238, 245),
              child: TextField(
                controller: pesoController,
                decoration: InputDecoration(
                label: 
                  Text('Digite seu peso',
                  style: GoogleFonts.spaceMono(fontSize: 20), 
                  )
                )
              ),
            ),

              const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 189, 238, 245),
              child: TextField(
                controller: alturaController,
                decoration: InputDecoration( 
                label:
                  Text ('Digite a sua altura',
                  style: GoogleFonts.spaceMono(fontSize: 20),
                  ),
                ),
              ),
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {
                  calcular();
                },
                style: ButtonStyle(),
                child: Text('CALCULAR',
                  style: GoogleFonts.spaceMono(fontSize: 20),
               ),
              ),

              const SizedBox(height: 20,),

              Text(
                resultado,
                style: GoogleFonts.spaceMono(fontSize: 20),
              ),
          ],
        ),
      ),
      ),
    );
  }
}
