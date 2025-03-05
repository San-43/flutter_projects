import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _buildMenuItem(context, 'Nuestras clínicas', [
            'Buscar clínica',
            'Servicios veterinarios',
          ]),
          _buildMenuItem(context, 'Sobre AniCura', [
            'Nuestra historia',
            'Calidad y seguridad',
          ]),
          _buildMenuItem(context, 'Trabaja con nosotros', []),
          _buildMenuItem(context, 'Contacto', []),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('flutterfire_300x.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('dash.png'),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
  Widget _buildMenuItem(BuildContext context, String title, List<String> options) {
    if (options.isEmpty) {
      return TextButton(
        onPressed: () {},
        child: Text(title, style: TextStyle(color: Colors.black)),
      );
    }
    return PopupMenuButton<String>(
      onSelected: (value) {},
      itemBuilder: (BuildContext context) {
        return options.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList();
      },
      child: TextButton(
        onPressed: null,
        child: Text(title, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}