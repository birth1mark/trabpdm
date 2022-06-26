// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trabpdm/res/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/utils/database.dart';

class AddPeca extends StatefulWidget {
  const AddPeca({
    Key? key,
  }) : super(key: key);

  @override
  _AddPecaState createState() => _AddPecaState();
}

class _AddPecaState extends State<AddPeca> {
  final _AddPecaKey = GlobalKey<FormState>();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  bool _isProcessing = false;

  final TextEditingController _nomePecaController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddPecaKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.0),
                  Text(
                    'Nome da Peca',
                    style: TextStyle(
                      color: colorOrange,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nomePecaController,
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Descrição',
                    style: TextStyle(
                      color: colorOrange,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _descricaoController,
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Preço',
                    style: TextStyle(
                      color: colorOrange,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _precoController,
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                  ),
                  FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      print('AAA');
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorOrange,
                      ),
                    );
                  },
                ),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorOrange,
                      ),
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          colorOrange,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_AddPecaKey.currentState!.validate()) {
                          setState(() {
                            _isProcessing = true;
                          });

                          await Database.addItem(
                            nomePeca: _nomePecaController.text,
                            descricao: _descricaoController.text,
                            preco: _precoController.text,
                          );

                          setState(() {
                            _isProcessing = false;
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'ADD ITEM',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: colorBlue,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
