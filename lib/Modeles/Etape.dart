import 'package:autorun/Modeles/anomalie.dart';
import 'package:autorun/Modeles/tache.dart';

class Etape {
  final int? idEtape;
  final String? dateDebutEtape;
  // final String? dateFinEtape;
   final String? detailsEtape;
  // final Tache? tache;

  const Etape({
    required this.idEtape,
    required this.dateDebutEtape,
    // required this.dateFinEtape,
//  required this.tache,
  required this.detailsEtape,
  });
}
