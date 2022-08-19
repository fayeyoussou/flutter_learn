import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'championnat_item.dart';

class ChampionnatScreen extends StatelessWidget {
  const ChampionnatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des championnats")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CHAMPIONNAT.map((championnatData) => ChampionnatItem(nom: championnatData.nom, color: championnatData.color,key : ValueKey(championnatData.id))).toList(),
      ),
    );
  }
}
