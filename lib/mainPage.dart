import 'package:admintea/screens/Prepare.dart';
import 'package:admintea/screens/pret.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'Widgets/TabElement.dart';

class MainPage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(HeightS * 0.23),
            child: AppBar(
              actions: [
                Icon(
                  CommunityMaterialIcons.cog,
                  color: Colors.black,
                  size: HeightS * 0.07,
                )
              ],
              titleSpacing: 10,
              backgroundColor: Color(0xff54CC7C),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: Container(
                  height: HeightS * 0.125,
                  child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    tabs: [
                      TabEl(
                        icon: CommunityMaterialIcons.chef_hat,
                        text: "A préparer",
                      ),
                      TabEl(
                        icon: FontAwesomeIcons.check,
                        text: "Prêt",
                      )
                    ],
                  ),
                ),
              ),
              title: Text('Admin',
                  style:
                      TextStyle(color: Colors.white, fontSize: HeightS * 0.07)),
            ),
          ),
          body: TabBarView(
            children: [
              Prepare(),
              Pret(),
            ],
          ),
        ),
      ),
    );
  }
}
