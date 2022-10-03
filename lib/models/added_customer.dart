import 'package:shiprocket/models/address_list.dart';

class AddedCustomer {
  String firstName;
  String lastName;
  String email;
  final String phoneNumber;
  final String alternateMobileNumber;
  final String houseNumber;
  final String streetName;
  final String landmark;
  final String pincode;
  final String city;
  final String state;
  final String country;
  final String createdAt;
  final List<AddressList> addressList;

  AddedCustomer({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.alternateMobileNumber = '',
    required this.houseNumber,
    required this.streetName,
    this.landmark = '',
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
    required this.createdAt,
    required this.addressList,
  });
}
