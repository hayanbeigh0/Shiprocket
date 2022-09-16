import 'package:flutter/material.dart';
import 'package:shiprocket/models/added_customer.dart';

class AddedCustomerProvider with ChangeNotifier {
  List<AddedCustomer> addedCustomers = [
    AddedCustomer(
      firstName: 'Hayan',
      lastName: 'Beigh',
      email: 'hayanbeigh119@gmail.com',
      phoneNumber: '7051744660',
      houseNumber: '31',
      streetName: 'Madina Bagh',
      pincode: '190015',
      city: 'Srinagar',
      state: 'Jammu & Kashmir',
      country: 'India',
      createdAt: DateTime.now().toString(),
    ),
    AddedCustomer(
      firstName: 'Rayan',
      lastName: 'Beigh',
      email: 'rayanbeigh119@gmail.com',
      phoneNumber: '8899524728',
      houseNumber: '31',
      streetName: 'Madina Bagh',
      pincode: '190015',
      city: 'Srinagar',
      state: 'J & K',
      country: 'India',
      createdAt: DateTime.now().toString(),
    ),
  ];
  void addNewCustomer(AddedCustomer newCustomer) {
    addedCustomers.add(newCustomer);
    notifyListeners();
  }

  void updateData({
    required int index,
    required String firstName,
    required String lastName,
    required String email,
  }) {
    addedCustomers[index].firstName = firstName;
    addedCustomers[index].lastName = lastName;
    addedCustomers[index].email = email;
    notifyListeners();
  }
}
