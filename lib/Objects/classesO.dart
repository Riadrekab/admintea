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

  ProduitC.constructor(this.cmd, this.nomC, this.prep, this.hour, this.minute);
}

class ListPr extends ChangeNotifier {
  static List<Commande> li_cmd1 = [
    Commande.constructor("Thé vert", 4),
    Commande.constructor("Croissant", 2),
  ];
  static List<Commande> li_cmd3 = [
    Commande.constructor("Thé vert", 4),
    Commande.constructor("Croissant", 2),
    Commande.constructor("Thé vert", 4),
    Commande.constructor("Croissant", 2),
  ];
  static List<Commande> li_cmd2 = [
    Commande.constructor("Bouteille d'eau", 4),
    Commande.constructor("Petit pain", 2)
  ];
  List<ProduitC> _liCmd = [
    ProduitC.constructor(li_cmd1, "Rekab", false, 15, 30),
    ProduitC.constructor(li_cmd2, "Hadouchi", false, 12, 20),
    ProduitC.constructor(li_cmd3, "Akbi", false, 12, 30),
  ];
  List<ProduitC> get getLi {
    return _liCmd;
  }

  ProduitC itemLi(int i) {
    return _liCmd[i];
  }

  void addCmd(ProduitC cmd) {
    _liCmd.add(cmd);
    notifyListeners();
  }

  void del(int i) {
    _liCmd.removeAt(i);
    notifyListeners();
  }

  int len() {
    return _liCmd.length;
  }

  void ready(int i) {
    _liCmd[i].prep = true;
    notifyListeners();
  }
}
