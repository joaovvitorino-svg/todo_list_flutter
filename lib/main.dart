
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'pages/login_page.dart';
import 'services/app_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage().ensureDefaultUser();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        onLogin: () {

        }
=======
import 'widgets/task_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Tarefas'),
        ),
        body: const Center(
          child: Text('Minhas tarefas aparecerão aqui!!!'),
        ),
        bottomNavigationBar: TaskInput(
          selectedDate: DateTime.now(),
          onAdd: (title, date) {
            debugPrint('Tarefa: $title');
            debugPrint('Data: $date');
          },
        ),
>>>>>>> bf6921c1853412d13de0bb5e02fd8e739e4ceecc
      ),
    );
  }
}
