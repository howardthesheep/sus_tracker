import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sus_tracker/data/app_state.dart';
import 'package:sus_tracker/data/player.dart';
import 'package:sus_tracker/widgets/edit_player_dialog.dart';

class Dialogs {
  static showEditPlayerDialog(BuildContext context) {
    // TODO: Check if other dialogs are showing, then close them before showing this one

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return EditPlayerDialog(updatePlayers: (Player player) {
          ScopedModel.of<AppState>(context).addPlayer(player);
        });
      },
    );
  }
}
