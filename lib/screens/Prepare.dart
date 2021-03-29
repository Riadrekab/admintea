import 'package:admintea/Objects/classesO.dart';
import 'package:admintea/Produit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Prepare extends StatefulWidget {
  _PrepareState createState() => _PrepareState();
}

class _PrepareState extends State<Prepare> {
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
  List<ProduitC> li_pr = [
    ProduitC.constructor(li_cmd1, "Rekab", false, 15, 30),
    ProduitC.constructor(li_cmd2, "Hadouchi", false, 12, 20),
    ProduitC.constructor(li_cmd3, "Akbi", false, 12, 30),
  ];
  List<ProduitC> li_pr_p = [];

  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: li_pr.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actions: [
              IconSlideAction(
                caption: "Prêt!",
                icon: Icons.thumb_up,
                color: Colors.green,
                onTap: () => setState(() {
                  li_pr_p.add(li_pr[i]);
                  li_pr.removeAt(i);
                  print(li_pr.length);
                }),
              ),
              IconSlideAction(
                caption: "Refuser",
                icon: Icons.delete,
                color: Colors.red,
                onTap: () => setState(() {
                  li_pr_p.add(li_pr[i]);
                  li_pr.removeAt(i);
                  print(li_pr.length);
                }),
              )
            ],
            child: ProduitCard(
              client: li_pr[i].nomC,
              li_cmd: li_pr[i].cmd,
              imgL: "assets/images/tea.png",
              img: true,
              h: li_pr[i].hour,
              m: li_pr[i].minute,
            ),
          ),
        );
      },
    );
  }
}
