import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sus_tracker/data/app_state.dart';
import 'package:sus_tracker/pages/home.dart';
import 'package:sus_tracker/widgets/dialogs.dart';

const appTitle = 'SusTracker';

void main() {
  runApp(
    MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key homePageKey = UniqueKey();
  AppState appState = AppState();

  void _resetPlayers(BuildContext context) {
    setState(() {
      homePageKey = UniqueKey();
    });
  }

  void _resetBoard(BuildContext context) {
    setState(() {
      appState = AppState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
      model: appState,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: HomePage(key: homePageKey),
        floatingActionButton: Builder(
          builder: (context) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () => _resetBoard(context),
                backgroundColor: Colors.red,
                tooltip: 'Reset Board',
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                onPressed: () => _resetPlayers(context),
                backgroundColor: const Color(0xFFAAAAAA),
                tooltip: 'Reset Players',
                child: const Icon(
                  Icons.restart_alt,
                  color: Color(0xFF3D3D3D),
                ),
              ),
              const SizedBox(width: 8.0),
              FloatingActionButton(
                onPressed: () => Dialogs.showEditPlayerDialog(context),
                tooltip: 'Add Player',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
