import 'package:flutter/material.dart';
import 'package:teste_dev_pleno/core/locator/service_locator.dart';
import 'package:teste_dev_pleno/core/storage/app_storage.dart';
import 'package:teste_dev_pleno/modules/login/presenter/pages/login_page.dart';

import 'core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogged = ServiceLocator.locator<AppStorage>().getIsLogged();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste para Desenvolvedor Flutter Pleno',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: isLogged ? Routes.home : Routes.login,
      home: const LoginPage(),
    );
  }
}
