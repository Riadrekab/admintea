import 'package:admintea/Objects/classesO.dart';
import 'package:admintea/Produit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Pret extends StatefulWidget {
  _PretState createState() => _PretState();
}

class _PretState extends State<Pret> {
  ListPr list = ListPr();

  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return Consumer<ListPr>(builder: (context, list, child) {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: list.len(),
        itemBuilder: (context, i) {
          return list.itemLi(i).prep
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actions: [
                      IconSlideAction(
                        caption: "Supprimer",
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
              : SizedBox(
                  height: 0,
                );
        },
      );
    });
  }
}
