import 'package:flutter/material.dart';
import 'package:garden_1m/data/datafirebase.dart';
import 'package:garden_1m/widget/widget_ppm/infocardPpm.dart';
import 'package:provider/provider.dart';

class InfoWidgetPpm extends StatelessWidget {
  const InfoWidgetPpm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataFirebase>(builder: (context, view, child) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                child: infoCardPpm(
                    colorInfo: Colors.white,
                    // context: context,
                    iconInfo: "assets/soi1.png",
                    nameInfo: "Humidity Indoor",
                    contentInfo: view.humidityIndoor.toString()),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                child: infoCardPpm(
                    colorInfo: Colors.white,
                    // context: context,
                    iconInfo: "assets/soi1.png",
                    nameInfo: "Soil Moisture",
                    contentInfo: view.soilMoisture.toString()),
              )
            ],
          ),
        ),
      );
    });
  }
}
