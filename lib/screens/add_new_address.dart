import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/models/address_list.dart';
import 'package:shiprocket/provider/added_customer.dart';
import 'package:shiprocket/screens/map_view.dart';

import '../utils/box_styles.dart';
import '../utils/color.dart';
import '../utils/functions/location_permissions.dart';
import '../widgets/text_form_field_container.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({
    super.key,
    required this.index,
  });

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
  final int index;
}

class _AddNewAddressState extends State<AddNewAddress> {
  final Completer<GoogleMapController> _controller = Completer();

  TextEditingController addressNicknameController = TextEditingController();

  TextEditingController contactNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController alternatePhoneNumberController =
      TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController houseNumberController = TextEditingController();

  TextEditingController streetNameController = TextEditingController();

  TextEditingController landmarkController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  late Future<Position> position;

  late LatLng pickedLocation;

  bool setAsPrimaryAddress = false;

  bool addressStatus = false;

  bool useDifferentAddressAsRtoAdress = false;

  var addresses = [
    "Primary: 60/5 ,Yusuf Sarai Market, Aurobindo Marg,Green Park New Delhi, 110016",
  ];

  @override
  void initState() {
    checkLocationPermissions();
    position = getCurrentLoc();
    super.initState();
  }

  late final customerAddressList;

  @override
  Widget build(BuildContext context) {
    customerAddressList = Provider.of<AddedCustomerProvider>(context)
        .addedCustomers[widget.index]
        .addressList;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxStyles.topBarContainerDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(136, 0, 0, 0),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Add New Address',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                gradient: const LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Color.fromARGB(119, 215, 216, 246),
                    Color.fromARGB(119, 215, 216, 246),
                  ],
                  stops: [
                    0.0,
                    0.23,
                    0.23,
                    1.0,
                  ],
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: FutureBuilder<Position>(
                            future: getCurrentLoc(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return lat == 0.0 && lng == 0.0
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: ColorStyle.colorPrimary,
                                          ),
                                        ),
                                      )
                                    : MapView(
                                        infoMsg:
                                            'Your order will be delivered here:',
                                        lat: lat,
                                        lng: lng,
                                        controller: _controller,
                                        pickedLoc: pickedLocation,
                                      );
                              }
                              if (snapshot.hasData) {
                                return MapView(
                                  infoMsg: 'Your order will be delivered here:',
                                  lat: lat,
                                  lng: lng,
                                  controller: _controller,
                                  pickedLoc: pickedLocation,
                                );
                              }
                              return lat == 0.0 && lng == 0.0
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: ColorStyle.colorPrimary,
                                        ),
                                      ),
                                    )
                                  : MapView(
                                      infoMsg:
                                          'Your order will be delivered here:',
                                      lat: lat,
                                      lng: lng,
                                      controller: _controller,
                                      pickedLoc: pickedLocation,
                                    );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 30,
                              child: Image.asset('assets/address-marker.png'),
                            ),
                            StreamBuilder<List<Placemark>>(
                              stream: placemarkController.stream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Expanded(
                                    child: Text(
                                      '${snapshot.data![0].street},${snapshot.data![0].subLocality}, ${snapshot.data![0].locality}',
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(195, 0, 0, 0),
                                      ),
                                    ),
                                  );
                                }
                                return const Text('Loading');
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Note: For local deliveries, the distance between pickup and delivery locations should be within 50 kms.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 225, 61, 49),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Delivery Address',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 71, 71, 71),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<List<Placemark>>(
                          stream: placemarkController.stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              houseNumberController.text =
                                  snapshot.data!.first.subLocality.toString();
                              pincodeController.text =
                                  snapshot.data!.first.postalCode.toString();
                              countryController.text =
                                  snapshot.data!.first.country.toString();
                              stateController.text = snapshot
                                  .data!.first.administrativeArea
                                  .toString();
                              cityController.text =
                                  snapshot.data!.first.locality.toString();
                              streetNameController.text =
                                  snapshot.data!.first.street.toString();
                            }
                            return Container(
                              padding: const EdgeInsets.all(14),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    color: Color.fromARGB(120, 158, 158, 158),
                                  )
                                ],
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        controller: houseNumberController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText:
                                              'House no /Flat no. Building Name (299/15, B-Block, Van Vihar)',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        controller: streetNameController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText:
                                              'locality / Street Name (Optional)',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        controller: landmarkController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Landmark (Optional)',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        controller: pincodeController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Pincode',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        enabled: false,
                                        controller: cityController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'City',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        enabled: false,
                                        controller: stateController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'State',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormFieldContainer(
                                    textForm: Center(
                                      child: TextField(
                                        enabled: false,
                                        controller: countryController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Country',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorStyle.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              customerAddressList.add(
                                AddressList(
                                  houseNumber: houseNumberController.text,
                                  streetName: streetNameController.text,
                                  landmark: landmarkController.text,
                                  pincode: pincodeController.text,
                                  city: cityController.text,
                                  state: stateController.text,
                                  country: countryController.text,
                                ),
                              );
                              print(customerAddressList.length);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Save Address',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> getCurrentLoc() async {
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    lat = pos.latitude;
    lng = pos.longitude;
    pickedLocation = LatLng(
      pos.latitude.toDouble(),
      pos.longitude.toDouble(),
    );
    return pos;
  }
}
