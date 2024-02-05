import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_repositories/my_app.dart';
// import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // final HiveInterface hive = Hive;
  // hive.init(directory.path);
  // hive.registerAdapter<Task>(TaskAdapter());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
