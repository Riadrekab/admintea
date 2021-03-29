import 'package:admintea/Objects/classesO.dart';
import 'package:admintea/Produit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Pret extends StatefulWidget {
  _PretState createState() => _PretState();
}

class _PretState extends State<Pret> {
  static List<Commande> li_cmd1 = [
    Commande.constructor("Thé vert", 4),
    Commande.constructor("Croissant", 2),
  ];

  List<ProduitC> li_pr = [
    ProduitC.constructor(li_cmd1, "Rekab", false, 15, 30),
  ];

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
                caption: "Supprimer",
                icon: Icons.delete,
                color: Colors.red,
                onTap: () => setState(() {
                  li_pr.removeAt(i);
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
