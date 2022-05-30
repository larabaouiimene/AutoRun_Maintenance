import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:autorun/utils/globals.dart' as globals;
import '../Modeles/tache.dart';
import '../Views/PannePage.dart';

class EtapeWidget extends StatelessWidget {
 EtapeWidget(
      {
        required this.cpt,
      required this.dateDebutEtape,
      required this.detailsEtape,
     });
     final int cpt;
  final String dateDebutEtape;
  final String detailsEtape;
  
  @override
  Widget build(BuildContext context) {
 
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(17)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 4), // Shadow position
          ),
        ],
      ),
      width: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Etape 0"+"${cpt}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    
                    color: color,
                    fontFamily: 'Nunito'),
              ), 
              
               SizedBox(width: 70), 
              Icon(
                      MyIcons.clock,
                      color: color,
                      size: 20,
                    ),
                     SizedBox(width: 10), 
                        Text(dateDebutEtape,
                         style: TextStyle(fontFamily: 'Nunito',fontSize: 10)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
             margin: EdgeInsets.only(left: 20, right: 20, top: 3 ,bottom: 3),
             decoration: BoxDecoration(
    color: Color.fromARGB(255, 243, 243, 208),
        borderRadius: BorderRadius.all(Radius.circular(17)),),

              
               
           child:  Text(detailsEtape, style: TextStyle(fontFamily: 'Nunito')),
          )
        ],
      ),
      
    );
    
  }
 
}
