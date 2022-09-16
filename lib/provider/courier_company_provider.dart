import 'package:flutter/material.dart';
import 'package:shiprocket/models/courier_company.dart';

class CourierCompanyProvider with ChangeNotifier {
  List<CourierCompany> courierCompanies = [
    CourierCompany(
      isDeliveryBoyNumberAvailable: false,
      isCallBeforeDeliveryAvailable: true,
      isTrackingRealTime: true,
      isPodInstant: false,
      rating: 4.4,
      courierCompanyImgUrl:
          'https://www.findcompanyinformation.com/wp-content/uploads/2022/05/Ekart-Logo.png',
      courierCompanyName: 'Ekart Logistics Surface',
    ),
    CourierCompany(
      isDeliveryBoyNumberAvailable: false,
      isCallBeforeDeliveryAvailable: true,
      isTrackingRealTime: true,
      isPodInstant: false,
      rating: 4.4,
      courierCompanyImgUrl:
          'https://www.findcompanyinformation.com/wp-content/uploads/2022/05/Ekart-Logo.png',
      courierCompanyName: 'Ekart 2KG',
    ),
  ];
}
