import 'package:flutter/material.dart';

class Commande {
  String nomP;
  int quantite;
  Commande.constructor(this.nomP, this.quantite);
}

class ProduitC {
  List<Commande> cmd;
  String nomC;
  bool prep;
  int hour;
  int minute;

  ProduitC.constructor(this.cmd, this.nomC, this.prep,this.hour,this.minute);
}
