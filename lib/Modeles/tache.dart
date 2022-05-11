import 'package:autorun/Modeles/anomalie.dart';

class Tache {
  final int idEtape;
  final String dateIntervention;
  final Anomalie anomalie;

  const Tache({
    required this.anomalie,
    required this.dateIntervention,
    required this.idEtape,
  });
}
