import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyConv',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'MoneyConv'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final TextEditingController _textFieldController = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _selectedOption = ' ';
  double _multiplier = 1.0;

  void _incrementCounter() {
    setState(() {
      final String text = _textFieldController.text;
      final double value = double.tryParse(text) ?? 0.0;
      final double result = value * _multiplier;
      final String mensagem =
          'O valor convertido fica: ${result.toStringAsFixed(2)}';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final String text = _textFieldController.text;
          final double value = double.tryParse(text) ?? 0.0;
          final double result = value * _multiplier;
          final String message =
              'O valor convertido fica: ${result.toStringAsFixed(2)}';
          return AlertDialog(
            title: const Text('Resultado'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  void Option1() {
    setState(() {
      _selectedOption = 'Voce selecionou a opção Dolar';
      _multiplier = 5.05;
    });
  }

  void Option2() {
    setState(() {
      _selectedOption = 'Voce selecionou a opção Euro';
      _multiplier = 5.60;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(style: ButtonStyle(),
              onPressed: Option1,
              child: const Text('Dolar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton (
              onPressed: Option2,
              child: const Text('Euro',
              ),
            ),
            
            Text(_selectedOption),
            TextField(
              style: TextStyle(letterSpacing: 1.5,
              color: Color.fromRGBO(240, 95, 11, 1),
              fontSize: 24),
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelStyle: TextStyle(color: Color.fromARGB(255, 238, 17, 17)),
                labelText: 'Digite o Valor em Reais',
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Calculo',
        label: Text('CALCULAR'),
      ),
      
    );
    
  }
}
