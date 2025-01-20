import 'package:flutter/material.dart';
import 'components/customButton.dart';
import 'theme/app_colors.dart'; // Import des couleurs définies
import 'components/customFormField.dart'; // Assurez-vous d'importer le fichier du formulaire

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  // Contrôleur pour le champ de texte
  final TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // Logique de votre bouton
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),

            // Container pour gérer la largeur du champ de formulaire
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 19), // 38px de marge de chaque côté
              width: MediaQuery.of(context).size.width - 38, // Largeur totale de l'écran moins la marge
              child: CustomFormField(
                icon: Icons.email, // Icône pour l'email
                label: 'Email',
                controller: _controller,
                keyboardType: TextInputType.emailAddress, // Type de clavier pour email
              ),
            ),
            const SizedBox(height: 20),

            // Container pour gérer la largeur du bouton
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 19), // 38px de marge de chaque côté
              width: MediaQuery.of(context).size.width - 38, // Largeur totale de l'écran moins la marge
              child: CustomButton(
                label: 'Submit',
                color: AppColors.primary, // Utilisation d'une couleur globale
                textColor: Colors.white,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  print('Email: ${_controller.text}');
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
