import 'package:autorun/Modeles/MyVehicule.dart';

class Anomalie {
  final int idAnomalie;
  final double logitudePositionVehicule;
  final double lalitudePositionVehicule;
  final String? niveauChargeVehicule;
  final String? temperatureVehicule;
  final String? dateFin;
  final String? dataDeclenchement;
  final MyVehicule? vehicule;
  final String? statutAnomalie;

  const Anomalie({
    required this.statutAnomalie,
    required this.idAnomalie,
    required this.dataDeclenchement,
    required this.logitudePositionVehicule,
    required this.lalitudePositionVehicule,
    required this.niveauChargeVehicule,
    required this.dateFin,
    required this.temperatureVehicule,
    required this.vehicule,
  });
}
