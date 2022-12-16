import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sus_tracker/data/app_state.dart';
import 'package:sus_tracker/widgets/player_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildPlayerLayout(AppState model) {
    List<Widget> playerWidgets = [];

    for (var player in model.players) {
      playerWidgets.add(
        PlayerCard(player: player),
      );
    }

    const int desiredCardSize = 320;

    return GridView.count(
      primary: false,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: (MediaQuery.of(context).size.width / desiredCardSize).ceil(),
      padding: const EdgeInsets.all(8.0),
      children: playerWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScopedModelDescendant<AppState>(
        builder: (context, child, model) => _buildPlayerLayout(model),
      ),
    );
  }
}
