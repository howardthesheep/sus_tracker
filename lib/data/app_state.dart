import 'package:scoped_model/scoped_model.dart';
import 'package:sus_tracker/data/player.dart';

class AppState extends Model {
  final Set<Player> _players = {};

  Set<Player> get players => _players;

  void addPlayer(Player newPlayer) {
    if (_players.contains(newPlayer)) {
      return;
    }

    _players.add(newPlayer);
    notifyListeners();
  }

  void removePlayer(Player player) {
    _players.remove(player);
    notifyListeners();
  }

  void updatePlayer(Player oldPlayer, Player newPlayer) {
    if (!_players.contains(oldPlayer)) {
      addPlayer(newPlayer);
      return;
    }

    _players.remove(oldPlayer);
    _players.add(newPlayer);
    notifyListeners();
  }
}
