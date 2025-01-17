// ignore_for_file: sort_child_properties_last

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Icons - View',
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
        const  Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'abc_outlined',
                child: Center(child: Icon(Icons.abc_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'baby_changing_station_outlined',
                child: Center(child: Icon(Icons.baby_changing_station_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'cabin_outlined',
                width: 170,
                child: Center(child: Icon(Icons.cabin_outlined),),
              ),
              WhiteCard(
                title: 'dangerous_outlined',
                child: Center(child: Icon(Icons.dangerous_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'e_mobiledata_outlined',
                child: Center(child: Icon(Icons.e_mobiledata_outlined),),
                width: 170,
              ),
              //----------------- otra carga
              WhiteCard(
                title: 'face_2_outlined',
                child: Center(child: Icon(Icons.face_2_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'g_mobiledata_outlined',
                child: Center(child: Icon(Icons.g_mobiledata_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'h_mobiledata_outlined',
                child: Center(child: Icon(Icons.h_mobiledata_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'ice_skating_outlined',
                child: Center(child: Icon(Icons.ice_skating_outlined),),
                width: 170,
              ),
              WhiteCard(
                title: 'javascript_outlined',
                child: Center(child: Icon(Icons.javascript_outlined),),
                width: 170,
              ),

            ],
          )
        ],
      ),
    );
  }
}
