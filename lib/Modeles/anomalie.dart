import 'package:autorun/Modeles/vehicule.dart';

class Anomalie {
  final int idAnomalie;
  final String? logitudePositionVehicule;
  final String? lalitudePositionVehicule;
  final String? niveauChargeVehicule;
  final String? statusAnomalie;
  final String? temperatureVehicule;
  final String? dateFin;
  final String? dataDeclenchement;
  final Vehicule? vehicule;

  const Anomalie(
      {required this.idAnomalie,
      required this.dataDeclenchement,
      required this.logitudePositionVehicule,
      required this.lalitudePositionVehicule,
      required this.niveauChargeVehicule,
      required this.dateFin,
      required this.statusAnomalie,
      required this.temperatureVehicule,
      required this.vehicule});
}
