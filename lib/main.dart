import 'package:flutter/material.dart';
import 'package:sus_tracker/widgets/amogus_bust.dart';
import 'package:sus_tracker/widgets/edit_player_dialog.dart';

import 'data/player.dart';

void main() {
  runApp(const MyApp());
}

const appTitle = 'SusTracker';
List<Player> players = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _showEditPlayerDialog() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return EditPlayerDialog(updatePlayers: (Player player) {
            players.add(player);
            setState(() {});
          });
        });
  }

  Widget _buildPlayerLayout() {
    List<Widget> playerWidgets = [];
    for (var element in players) {
      playerWidgets.add(MouseRegion(
        onEnter: (event) => setState(() {
          print('_isHovered = true');
        }),
        onExit: (event) => setState(() {
          print('_isHovered = false');
        }),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: double.infinity, // This makes column fill the full width of Grid
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(element.name),
                  Text('Color: ${element.color.value}'),
                  AmogusBust(color: element.color)
                ],
              ),
            ),
          ],
        ),
      ));
    }

    return GridView.count(
      primary: false,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 4,
      padding: const EdgeInsets.all(8.0),
      children: playerWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(child: _buildPlayerLayout()),
      floatingActionButton: FloatingActionButton(
        onPressed: _showEditPlayerDialog,
        tooltip: 'Add Player',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
