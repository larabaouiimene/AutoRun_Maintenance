import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vehicule {
  String matricule;
  String marque;
  String modele;
  String couleur;
  String type;
  String charge;
  double prix;
  double distance;
  String location;
  String image;
  LatLng locationCoords;

  Vehicule(
      {required this.matricule,
      required this.marque,
      required this.modele,
      required this.couleur,
      required this.type,
      required this.charge,
      required this.prix,
      required this.distance,
      required this.location,
      required this.image,
      required this.locationCoords});
}

final List<Vehicule> vehicules = [
  Vehicule(
    matricule: '123456 00 16',
    marque: 'Audi',
    modele: 'R8',
    couleur: 'Grise',
    type: "Sport",
    charge: "98%",
    prix: 2000,
    distance: 50,
    location: "El harrach",
    locationCoords: LatLng(36.72357233499315, 3.138244012497361),
    image: 'assets/imgs/car.png',
  ),
  Vehicule(
      matricule: '123456 00 16',
      marque: 'Audi',
      modele: 'R8',
      couleur: 'Grise',
      type: "Sport",
      charge: "98%",
      prix: 2000,
      distance: 50,
      location: "El harrach",
      locationCoords: LatLng(36.73402859153134, 3.0925820867497014),
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Vehicule(
      matricule: '123456 00 16',
      marque: 'Audi',
      modele: 'R8',
      couleur: 'Grise',
      type: "Sport",
      charge: "98%",
      prix: 2000,
      distance: 50,
      location: "El harrach",
      locationCoords: LatLng(36.72219640576765, 3.183905938245022),
      image:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Vehicule(
      matricule: '123456 00 16',
      marque: 'Audi',
      modele: 'R8',
      couleur: 'Grise',
      type: "Sport",
      charge: "98%",
      prix: 2000,
      distance: 50,
      location: "El harrach",
      locationCoords: LatLng(36.69742546502124, 3.075415949250581),
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Vehicule(
      matricule: '123456 00 16',
      marque: 'Audi',
      modele: 'R8',
      couleur: 'Grise',
      type: "Sport",
      charge: "98%",
      prix: 2000,
      distance: 50,
      location: "El harrach",
      locationCoords: LatLng(36.696324348991226, 3.129660943747801),
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no'),
];
