import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sus_tracker/data/player.dart';

class EditPlayerDialog extends StatefulWidget {
  const EditPlayerDialog({super.key, required this.updatePlayers});

  final Function(Player) updatePlayers;

  @override
  State<StatefulWidget> createState() => _EditPlayerDialogState();
}

class _EditPlayerDialogState extends State<EditPlayerDialog> {
  Color? _selectedColor;
  final TextEditingController _nameController = TextEditingController();

  // Source for Among us colors https://among-us.fandom.com/wiki/Colors
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.yellow,
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.brown,
    Colors.cyan,
    Colors.grey,
    const Color(0xFF800000), // Maroon
    const Color(0xFFff007f), // Rose
    const Color(0xFFffe135), // Banana
    const Color(0xFFD2B48C), // Tan
    const Color(0xFFFF7F50), // Coral
  ];

  // Handles when a user selects a color from the picker
  void _onColorChanged(Color newColor) {
    if (_selectedColor == newColor) {
      return;
    }

    setState(() {
      _selectedColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Player'),
      contentPadding: const EdgeInsets.all(8.0),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: const EdgeInsets.all(8.0),
          child: const Text('Cancel'),
        ),
        MaterialButton(
          onPressed: () {
            widget.updatePlayers(
              Player(color: _selectedColor ?? Colors.black, name: _nameController.value.text),
            );
            Navigator.of(context).pop();
          },
          padding: const EdgeInsets.all(8.0),
          child: const Text('Submit'),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            maxLines: 1,
            autofocus: true,
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(height: 50.0),
          SingleChildScrollView(
            child: BlockPicker(
              pickerColor: Colors.black,
              onColorChanged: _onColorChanged,
              useInShowDialog: true,
              availableColors: _colors,
            ),
          )
        ],
      ),
    );
  }
}
