import 'package:crud/firebase_options.dart';
import 'package:crud/view/AddCRUD.dart';
import 'package:crud/view/DetailCRUD.dart';
import 'package:crud/view/EditCRUD.dart';
import 'package:crud/view/HomeCRUD.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).catchError((error) {
    print('Error initializing Firebase: $error');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeCRUD()),
        GetPage(name: '/add', page: () => AddCRUD()),
        GetPage(name: '/edit', page: () => EditCRUD()),
        GetPage(name: '/detail', page: () => DetailCRUD())
      ],
    );
  }
}
