import 'package:autorun/Modeles/anomalie.dart';

class Tache {
  final int? idTache;
  final String? dateIntervention;
  final Anomalie? anomalie;

  const Tache({
    required this.idTache,
    required this.dateIntervention,
    required this.anomalie,
  });
}
