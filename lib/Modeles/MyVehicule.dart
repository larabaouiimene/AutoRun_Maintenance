import 'package:autorun/Modeles/typeVehicule.dart';

class MyVehicule {
  final int idVehicule;
  final String? marque;
  final String? matricule;
  final String? modele;
  final String? couleur;
  final bool verrouillee;
  final bool enService;
  final int? amVehicule;

  const MyVehicule({
    required this.enService,
    required this.amVehicule,
    required this.couleur,
    required this.matricule,
    required this.modele,
    required this.verrouillee,
    required this.idVehicule,
    required this.marque,
  });
}
