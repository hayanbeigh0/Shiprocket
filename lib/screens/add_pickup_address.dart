import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiprocket/screens/map_view.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

import '../utils/box_styles.dart';
import '../utils/color.dart';
import '../utils/functions/location_permissions.dart';
import '../widgets/common_top_bar.dart';

final StreamController<List<Placemark>> placemarkController =
    StreamController<List<Placemark>>.broadcast();

class AddPickupAddress extends StatefulWidget {
  const AddPickupAddress({super.key});

  @override
  State<AddPickupAddress> createState() => _AddPickupAddressState();
}

class _AddPickupAddressState extends State<AddPickupAddress> {
  Completer<GoogleMapController> _controller = Completer();
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

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'Add a Pickup Address',
                  style: const TextStyle(
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
                                            'Your order will be picked up from here:',
                                        lat: lat,
                                        lng: lng,
                                        controller: _controller,
                                        pickedLoc: pickedLocation,
                                      );
                              }
                              if (snapshot.hasData) {
                                return MapView(
                                  infoMsg:
                                      'Your order will be picked up from here:',
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
                                          'Your order will be picked up from here:',
                                      lat: lat,
                                      lng: lng,
                                      controller: _controller,
                                      pickedLoc: pickedLocation,
                                    );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
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
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(195, 0, 0, 0),
                                      ),
                                    ),
                                  );
                                }
                                return Text('Loading');
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
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
                              Row(
                                children: [
                                  Text(
                                    'Address Status',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 114, 114, 114),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '(Active)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 72, 72, 72),
                                    ),
                                  ),
                                  Spacer(),
                                  Switch(
                                    activeColor: ColorStyle.colorPrimary,
                                    value: addressStatus,
                                    onChanged: (value) {
                                      setState(() {
                                        addressStatus = !addressStatus;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Color.fromARGB(255, 217, 216, 216),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Set this address as Primary',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 114, 114, 114),
                                    ),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                    activeColor: ColorStyle.colorPrimary,
                                    checkColor: Colors.white,
                                    value: setAsPrimaryAddress,
                                    onChanged: (value) {
                                      setState(() {
                                        setAsPrimaryAddress =
                                            !setAsPrimaryAddress;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Pickup Address',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 71, 71, 71),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<List<Placemark>>(
                            stream: placemarkController.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                print(snapshot.data.toString());
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
                                padding: EdgeInsets.all(14),
                                margin: EdgeInsets.symmetric(horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
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
                                          controller: addressNicknameController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Address Nick Name',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: contactNameController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Contact Name',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: phoneNumberController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Phone Number',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller:
                                              alternatePhoneNumberController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText:
                                                'Alternate Phone Number (Optional)',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Email ID',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: houseNumberController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText:
                                                'House no /Flat no. Buildina Name (299/15, B-Block, Van Vihar)',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: streetNameController,
                                          decoration: InputDecoration(
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: landmarkController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Landmark (Optional)',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          controller: pincodeController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Pincode',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          enabled: false,
                                          controller: cityController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'City',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          enabled: false,
                                          controller: stateController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'State',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormFieldContainer(
                                      textForm: Center(
                                        child: TextField(
                                          enabled: false,
                                          controller: countryController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Country',
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'RTO Address',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 49, 49, 49),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 5,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 1,
                                color: Color.fromARGB(120, 158, 158, 158),
                              )
                            ],
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                'Use different address as RTO Address',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 122, 121, 121),
                                ),
                              ),
                              Spacer(),
                              Checkbox(
                                activeColor: ColorStyle.colorPrimary,
                                checkColor: Colors.white,
                                value: useDifferentAddressAsRtoAdress,
                                onChanged: (value) {
                                  setState(() {
                                    useDifferentAddressAsRtoAdress =
                                        !useDifferentAddressAsRtoAdress;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        useDifferentAddressAsRtoAdress
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Note: RTO Address is only applicable in Xpressbees, Delhivery and Ecom express',
                                      style: TextStyle(
                                        fontSize: 13.2,
                                        color:
                                            Color.fromARGB(255, 123, 123, 123),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(13.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: ColorStyle.borderGrey,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                            color: Color.fromARGB(
                                                58, 158, 158, 158),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Select Existing Address',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 49, 49, 49),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: TextFormFieldContainer(
                                              textForm: DropdownButtonFormField(
                                                isExpanded: true,
                                                iconSize: 30,
                                                icon: Transform.translate(
                                                  offset: const Offset(
                                                    0,
                                                    -15,
                                                  ),
                                                  child: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText:
                                                      "Address Nick Name",
                                                  labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 111, 111, 112),
                                                    fontSize: 14,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                                items: addresses
                                                    .map(
                                                      (item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          maxLines: 1,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Divider(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text('OR'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Divider(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: 45,
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        side: BorderSide(
                                                          color: ColorStyle
                                                              .colorPrimary,
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            topRight:
                                                                Radius.circular(
                                                                    30),
                                                          ),
                                                        ),
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.85,
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 17,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        14.0,
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        'RTO Contact Info',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      SizedBox(
                                                                        width:
                                                                            30,
                                                                        child:
                                                                            IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                            Icons.close,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.all(14.0),
                                                                          padding:
                                                                              EdgeInsets.all(14.0),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: ColorStyle.borderGrey,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: addressNicknameController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'Address Nick Name',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: contactNameController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'Contact Name',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: phoneNumberController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'Phone Number',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: alternatePhoneNumberController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'Alternate Phone Number (Optional)',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: emailController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'Email ID',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: houseNumberController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'House no /Flat no. Buildina Name (299/15, B-Block, Van Vihar)',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: streetNameController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'locality / Street Name (Optional)',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              TextFormFieldContainer(
                                                                                textForm: Center(
                                                                                  child: TextField(
                                                                                    controller: landmarkController,
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      labelText: 'Landmark (Optional)',
                                                                                      labelStyle: TextStyle(
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: TextFormFieldContainer(
                                                                                      textForm: Center(
                                                                                        child: TextField(
                                                                                          controller: pincodeController,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                            labelText: 'Pincode',
                                                                                            labelStyle: TextStyle(
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 14,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: TextFormFieldContainer(
                                                                                      backgroundColor: Color.fromARGB(10, 74, 67, 122),
                                                                                      textForm: Center(
                                                                                        child: TextField(
                                                                                          enabled: false,
                                                                                          controller: cityController,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                            labelText: 'City',
                                                                                            labelStyle: TextStyle(
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: TextFormFieldContainer(
                                                                                      backgroundColor: Color.fromARGB(10, 74, 67, 122),
                                                                                      textForm: Center(
                                                                                        child: TextField(
                                                                                          enabled: false,
                                                                                          controller: stateController,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                            labelText: 'State',
                                                                                            labelStyle: TextStyle(
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 14,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: TextFormFieldContainer(
                                                                                      backgroundColor: Color.fromARGB(10, 74, 67, 122),
                                                                                      textForm: Center(
                                                                                        child: TextField(
                                                                                          enabled: false,
                                                                                          controller: countryController,
                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                            labelText: 'Country',
                                                                                            labelStyle: TextStyle(
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 14.0),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              55,
                                                                          child:
                                                                              ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              elevation: 0,
                                                                              backgroundColor: ColorStyle.colorPrimary,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                Text(
                                                                              'Add Address',
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              70,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      '+Add New Address',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorStyle
                                                            .colorPrimary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              'Note: New address will be saved as a pickup address',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Expanded(
                          child: SizedBox(),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
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
                            onPressed: () {},
                            child: Text(
                              'Save Address',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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

getAddress() async {
  placemarks = await placemarkFromCoordinates(
    lat,
    lng,
  );
}
