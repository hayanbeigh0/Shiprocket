import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

class Barcode extends StatelessWidget {
  Color colorPrimary = const Color.fromARGB(206, 75, 33, 243);
  Barcode({Key? key}) : super(key: key);
  final MobileScannerController cameraController = MobileScannerController();
  final bool isButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: Stack(
                      children: [
                        MobileScanner(
                          allowDuplicates: false,
                          controller: cameraController,
                          onDetect: (barcode, args) {
                            if (barcode.rawValue == null) {
                            } else {
                              final String code = barcode.rawValue!;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: OverlayWithRectangleClipping(),
                          // child: CustomPaint(
                          //   foregroundPainter: BorderPainter(),
                          //   child: Container(
                          //     width: 200,
                          //     height: 100,
                          //     color: Color.fromARGB(9, 251, 233, 231),
                          //   ),
                          // ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          height: 500,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Barcode Scanner',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          bottom: 50,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: const Color.fromARGB(168, 0, 0, 0),
                              ),
                              child: const Text(
                                'Point vour camera at a barcode',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 10,
                          child: IconButton(
                            color: Colors.white,
                            icon: ValueListenableBuilder(
                              valueListenable: cameraController.torchState,
                              builder: (context, state, child) {
                                switch (state as TorchState) {
                                  case TorchState.off:
                                    return const Icon(
                                      Icons.flash_off,
                                      color: Colors.grey,
                                    );
                                  case TorchState.on:
                                    return const Icon(
                                      Icons.flash_on,
                                      color: Colors.yellow,
                                    );
                                }
                              },
                            ),
                            iconSize: 32.0,
                            onPressed: () => cameraController.toggleTorch(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 6.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '® ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '1. You can scan multiple Shipping Labels. All scanned AWBs will be listed below. Click on any AWB to view Order details.',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '2. Packages being picked up from the same Pickup Address, & beina sent through the same Carrier Company will be added to the same Manifest, post generating manifest.',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
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
                            0.06,
                            0.06,
                            1.0,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                              border: Border.all(
                                color: const Color.fromARGB(61, 158, 158, 158),
                              ),
                              color: Colors.white,
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    'Generate Manifest for AWB',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(30.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'AWB Number',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 75,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorPrimary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              onPressed: isButtonDisabled ? null : () {},
                              child: const Text(
                                'Proceed',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverlayWithRectangleClipping extends StatelessWidget {
  const OverlayWithRectangleClipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: _getCustomPaintOverlay(context));
  }

  //CustomPainter that helps us in doing this
  CustomPaint _getCustomPaintOverlay(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: RectanglePainter(),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference, //simple difference of following operations
        //bellow draws a rectangle of full screen (parent) size
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        //bellow clips out the circular rectangle with center as offset and dimensions you need to set
        Path()
          ..addRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                center: Offset(size.width * 0.5, size.height * 0.5),
                width: size.width * 0.85,
                height: size.height * 0.4,
              ),
              const Radius.circular(0),
            ),
          )
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double cornerSide = sh * 0.1; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
