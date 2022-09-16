class CourierCompany {
  final bool isDeliveryBoyNumberAvailable;
  final bool isCallBeforeDeliveryAvailable;
  final bool isPodInstant;
  final bool isTrackingRealTime;
  final double rating;
  final String courierCompanyImgUrl;
  final String courierCompanyName;

  CourierCompany({
    required this.isDeliveryBoyNumberAvailable,
    required this.isCallBeforeDeliveryAvailable,
    required this.isPodInstant,
    required this.isTrackingRealTime,
    required this.rating,
    required this.courierCompanyImgUrl,
    required this.courierCompanyName,
  });
}
