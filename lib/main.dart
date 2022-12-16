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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
      model: AppState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const HomePage(),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => Dialogs.showEditPlayerDialog(context),
            tooltip: 'Add Player',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
