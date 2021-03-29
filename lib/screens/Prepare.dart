import 'package:admintea/Objects/classesO.dart';
import 'package:admintea/Produit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Prepare extends StatefulWidget {
  _PrepareState createState() => _PrepareState();
}

class _PrepareState extends State<Prepare> {
  // static List<Commande> li_cmd1 = [
  //   Commande.constructor("Thé vert", 4),
  //   Commande.constructor("Croissant", 2),

  // ];
  // static List<Commande> li_cmd3 = [
  //   Commande.constructor("Thé vert", 4),
  //   Commande.constructor("Croissant", 2),
  //   Commande.constructor("Thé vert", 4),
  //   Commande.constructor("Croissant", 2),
  // ];
  // static List<Commande> li_cmd2 = [
  //   Commande.constructor("Bouteille d'eau", 4),
  //   Commande.constructor("Petit pain", 2)
  // ];
  // List<ProduitC> li_pr = [
  //   ProduitC.constructor(li_cmd1, "Rekab", false, 15, 30),
  //   ProduitC.constructor(li_cmd2, "Hadouchi", false, 12, 20),
  //   ProduitC.constructor(li_cmd3, "Akbi", false, 12, 30),
  // ];
  // List<ProduitC> li_pr_p = [];

  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return Consumer<ListPr>(builder: (context, list, child) {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: list.len(),
        itemBuilder: (context, i) {
          return (!list.itemLi(i).prep)
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actions: [
                      IconSlideAction(
                        caption: "Prêt!",
                        icon: Icons.thumb_up,
                        color: Colors.green,
                        onTap: () => setState(() {
                         Provider.of<ListPr>(context,listen: false).ready(i);
                        }),
                      ),
                      IconSlideAction(
                        caption: "Refuser",
                        icon: Icons.delete,
                        color: Colors.red,
                        onTap: () => setState(() {
                          Provider.of<ListPr>(context,listen: false).del(i);
                        }),
                      )
                    ],
                    child: ProduitCard(
                      client: list.itemLi(i).nomC,
                      li_cmd: list.itemLi(i).cmd,
                      imgL: "assets/images/tea.png",
                      img: true,
                      h: list.itemLi(i).hour,
                      m: list.itemLi(i).minute,
                    ),
                  ),
                )
              : SizedBox(height: 0);
        },
      );
    });
  }
}
