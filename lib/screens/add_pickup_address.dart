import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

import '../utils/box_styles.dart';
import '../utils/color.dart';
import '../widgets/common_top_bar.dart';

List<Placemark> placemarks = [];
double lat = 0.0;
double lng = 0.0;
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

  @override
  void initState() {
    checkLocationPermissions();
    position = getCurrentLoc();
    super.initState();
  }

  late Future<Position> position;
  late LatLng pickedLocation;
  bool setAsPrimaryAddress = false;
  bool addressStatus = false;
  bool useDifferentAddressAsRtoAdress = false;

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
                                        lat: lat,
                                        lng: lng,
                                        controller: _controller,
                                        pickedLoc: pickedLocation,
                                      );
                              }
                              if (snapshot.hasData) {
                                return MapView(
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
                          height: 20,
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

class MapView extends StatefulWidget {
  MapView({
    Key? key,
    required this.lat,
    required this.lng,
    required this.pickedLoc,
    required Completer<GoogleMapController> controller,
  })  : _controller = controller,
        super(key: key);

  final double lat;
  final double lng;
  final Completer<GoogleMapController> _controller;
  LatLng pickedLoc;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Set<Marker> markers = {};
  BitmapDescriptor pickedLocationMarker = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    setCustomMarkerIcon();
    super.initState();
  }

  setCustomMarkerIcon() async {
    await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/place-picker.png",
    ).then((icon) {
      setState(() {
        pickedLocationMarker = icon;
      });
      return pickedLocationMarker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.lat,
              widget.lng,
            ),
            zoom: 14.4746,
          ),
          scrollGesturesEnabled: true,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (controller) async {
            widget._controller.complete(controller);
            placemarks = await placemarkFromCoordinates(
              widget.pickedLoc.latitude,
              widget.pickedLoc.longitude,
            );
          },
          onCameraIdle: () async {
            placemarks = await placemarkFromCoordinates(
              widget.pickedLoc.latitude,
              widget.pickedLoc.longitude,
            );
            placemarkController.add(placemarks);
          },
          onCameraMove: (position) async {
            widget.pickedLoc = position.target;
          },
          mapType: MapType.terrain,
        ),
        const MapSearchField(),
        Center(
          child: Transform.translate(
            offset: Offset(0, -45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 95, 82, 210),
                        border: Border.all(
                          color: Color.fromARGB(255, 95, 82, 210),
                        ),
                      ),
                      height: 40,
                      child: StreamBuilder<List<Placemark>>(
                        stream: placemarkController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              'Your order will be picked up from here: ${snapshot.data![0].street},${snapshot.data![0].subLocality}, ${snapshot.data![0].locality}, ${snapshot.data![0].postalCode}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            );
                          }
                          return Text('Loading');
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Transform.translate(
                        offset: const Offset(0, 11.5),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 22.5,
                            height: 12.5,
                            child: Transform.rotate(
                              angle: 3.14,
                              child: CustomPaint(
                                painter: TrianglePainter(
                                  strokeColor: Color.fromARGB(255, 95, 82, 210),
                                  strokeWidth: 10,
                                  paintingStyle: PaintingStyle.fill,
                                ),
                                child: const SizedBox(
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 40,
                  child: Image.asset('assets/place-picker.png'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

getAddress() async {
  placemarks = await placemarkFromCoordinates(
    lat,
    lng,
  );
}

class MapSearchField extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  const MapSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: TextFormFieldContainer(
          textForm: Center(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a nearby landmark',
                prefixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

checkLocationPermissions() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
