import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/my_bus_icons.dart';
import 'package:shiprocket/my_icons_icons.dart';
import 'package:shiprocket/provider/courier_company_provider.dart';
import 'package:shiprocket/utils/color.dart';
import 'package:shiprocket/widgets/courier_company_card.dart';

class ActivatedCourierCompanies extends StatefulWidget {
  ActivatedCourierCompanies({Key? key}) : super(key: key);

  @override
  State<ActivatedCourierCompanies> createState() =>
      _ActivatedCourierCompaniesState();
}

class _ActivatedCourierCompaniesState extends State<ActivatedCourierCompanies> {
  @override
  Widget build(BuildContext context) {
    final courierCompanies =
        Provider.of<CourierCompanyProvider>(context, listen: false)
            .courierCompanies;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        itemCount: courierCompanies.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CourierCompanyCard(
            isDeliveryBoyNumberAvailable:
                courierCompanies[index].isDeliveryBoyNumberAvailable,
            isCallBeforeDeliveryAvailable:
                courierCompanies[index].isCallBeforeDeliveryAvailable,
            isPodInstant: courierCompanies[index].isPodInstant,
            isTrackingRealTime: courierCompanies[index].isTrackingRealTime,
            rating: courierCompanies[index].rating,
            courierCompanyImgUrl: courierCompanies[index].courierCompanyImgUrl,
            courierCompanyName: courierCompanies[index].courierCompanyName,
          ),
        ),
      ),
    );
  }
}
