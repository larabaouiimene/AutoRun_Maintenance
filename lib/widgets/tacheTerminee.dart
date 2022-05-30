import 'package:autorun/assets/Fleche.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/Fleche.dart';

import '../Views/EtapePage.dart';

class TacheTermine extends StatelessWidget {
  static const color = Color(0XFF4361EE);
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MesEtapes()));
                },
                child: const Text(
                  "Voir les étapes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 12,
                      fontFamily: 'Nunito'),
                )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tâche Terminée",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    fontSize: 25,
                    color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
