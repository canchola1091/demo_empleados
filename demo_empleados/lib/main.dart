import 'package:demo_empleados/src/data/global_preferences.dart';
import 'package:demo_empleados/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() async{
  WidgetsFlutterBinding();
  final GlobalPreferences _globalPreferences = GlobalPreferences();
  await _globalPreferences.initVarsPermanentes();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalPreferences _globalPrefs = GlobalPreferences();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Empleados',
      // initialRoute: '/user_page', // TODO: Agregar lógica para ver que pantalla mostrar
      initialRoute: '/employees_page', // TODO: Agregar lógica para ver que pantalla mostrar
      getPages: Routes.routes,
    );
  }
}