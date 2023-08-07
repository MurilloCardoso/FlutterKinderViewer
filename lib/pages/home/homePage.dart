import 'dart:convert';
import 'dart:io';

import 'package:app/materials/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? _selectedImagePath = [];

  @override
  void initState() {
    super.initState();
    // Configura o MethodChannel para receber a URI da imagem
    const platform = MethodChannel('samples.flutter.dev/gallery');
    platform.setMethodCallHandler(_handleImageSelected);
  }

  // Função para lidar com a URI da imagem selecionada
  Future<void> _handleImageSelected(MethodCall call) async {
    if (call.method == 'imageSelected') {
      setState(() {
        _selectedImagePath!.add(call.arguments);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorsPalette.orangePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 65, 65, 65),
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  const platform = MethodChannel('samples.flutter.dev/gallery');
                  await platform.invokeMethod('openGallery');
                },
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.upload_file,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ),
                        const Text(
                          "Upload",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              _selectedImagePath != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 1,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _selectedImagePath!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.black,
                              width: 130,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () =>
                                        Navigator.pushNamed(context, '/viewer'),
                                    child: Image.file(
                                      File(_selectedImagePath![
                                          index]), // Use a variável _selectedImageUri diretamente
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : const Center(
                      child: Text(
                        "Lista Vazia !",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
