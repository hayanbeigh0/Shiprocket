import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/text_form_field_container.dart';

List<Placemark> placemarks = [];
double lat = 0.0;
double lng = 0.0;
final StreamController<List<Placemark>> placemarkController =
    StreamController<List<Placemark>>.broadcast();

class MapView extends StatefulWidget {
  MapView({
    Key? key,
    required this.lat,
    required this.lng,
    required this.pickedLoc,
    required this.infoMsg,
    required Completer<GoogleMapController> controller,
  })  : _controller = controller,
        super(key: key);
  String infoMsg;
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
            offset: const Offset(0, -45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 95, 82, 210),
                        border: Border.all(
                          color: const Color.fromARGB(255, 95, 82, 210),
                        ),
                      ),
                      height: 40,
                      child: StreamBuilder<List<Placemark>>(
                        stream: placemarkController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${widget.infoMsg} ${snapshot.data![0].street},${snapshot.data![0].subLocality}, ${snapshot.data![0].locality}, ${snapshot.data![0].postalCode}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            );
                          }
                          return const Text('Loading');
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
                                  strokeColor:
                                      const Color.fromARGB(255, 95, 82, 210),
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
                const SizedBox(
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

class MapSearchField extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  const MapSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: const TextFormFieldContainer(
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
