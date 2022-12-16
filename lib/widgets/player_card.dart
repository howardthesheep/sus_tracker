import 'package:flutter/material.dart';
import 'package:sus_tracker/data/enums.dart';
import 'package:sus_tracker/data/player.dart';
import 'package:sus_tracker/widgets/amogus_bust.dart';

class PlayerCard extends StatefulWidget {
  final Player player;

  const PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  bool isHovered = false;
  bool isDead = false;
  AgentStatus status = AgentStatus.unknown;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        setState(() {
          isHovered = true;
        });
      }),
      onExit: (event) => setState(() {
        setState(() {
          isHovered = false;
        });
      }),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: double.infinity, // This makes column fill the full width of Grid
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.player.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: AmogusBust(color: widget.player.color, status: status),
                  ),
                ],
              ),
              if (isDead)
                IgnorePointer(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                            color: Colors.red.withAlpha(128),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              if (isHovered)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                isDead = true;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                  ),
                                  color: Colors.red.withAlpha(128),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Dead',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                isDead = false;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                  ),
                                  color: Colors.grey.withAlpha(128),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Alive',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ), // Dead or alive
                    SizedBox(
                      height: 8.0,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                status = AgentStatus.imposter;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                  ),
                                  color: Colors.red.withAlpha(128),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sus',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                status = AgentStatus.unknown;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withAlpha(128),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Unknown',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                status = AgentStatus.crewmate;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                  color: Colors.green.withAlpha(128),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.green,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Good',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
