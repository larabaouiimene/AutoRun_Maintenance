import 'package:autorun/Modeles/anomalie.dart';

class Tache {
  final int? idTache;
  final String? dateInterventionTache;
  final Anomalie anomalie;
  final String? dateFinTache;
  final bool tache_terminee;
  final String? nomTache;
  final String? descriptionTache;

  const Tache({
    required this.descriptionTache,
    required this.nomTache,
    required this.tache_terminee,
    required this.dateFinTache,
    required this.idTache,
    required this.dateInterventionTache,
    required this.anomalie,
  });
}
