class Anomalie {
  final int idAnomalie;
  final double? logitudePositionVehicule;
  final double? lalitudePositionVehicule;
  final int? niveauChargeVehicule;
  final String? statusAnomalie;
  final int? temperatureVehicule;
  final String? dateFin;
  final String? dataDeclenchement;

  const Anomalie({
    required this.idAnomalie,
    required this.dataDeclenchement,
    required this.logitudePositionVehicule,
    required this.lalitudePositionVehicule,
    required this.niveauChargeVehicule,
    required this.dateFin,
    required this.statusAnomalie,
    required this.temperatureVehicule,
  });
}
