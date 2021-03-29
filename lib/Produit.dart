import 'package:admintea/Objects/classesO.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitCard extends StatefulWidget {
  int i;
  int h;
  int m;
  String imgL;
  int quantite;
  bool img;
  String client;
  Icon icon;
  List<Commande> li_cmd = [];
  ProduitCard({
    this.li_cmd,
    this.icon,
    this.img,
    this.imgL,
    this.client,
    this.h,
    this.m,
  });
  _ProduitState createState() => _ProduitState();
}

class _ProduitState extends State<ProduitCard> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

    return Container(
      width: WidthS,
      height: HeightS * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        color: Color(0xffaae6be),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 5, bottom: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Client: " + widget.client,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "prét à: " + widget.h.toString() + ":" + widget.m.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.li_cmd.length,
              itemBuilder: (BuildContext context, int i) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text("Commande " + (i + 1).toString()),
                        Container(
                          height: HeightS * 0.15,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  widget.li_cmd[i].nomP,
                                  style: TextStyle(
                                      fontSize: WidthS * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Quantité: " +
                                      widget.li_cmd[i].quantite.toString(),
                                  style: TextStyle(
                                      fontSize: HeightS * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
