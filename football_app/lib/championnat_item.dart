import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChampionnatItem extends StatelessWidget {
  const ChampionnatItem({Key? key,required this.nom,required this.color}) : super(key: key);
  final String nom;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(nom),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.6),color],
          begin: Alignment.topLeft,
          end:  Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)
          ),
    );
  }
}
