import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';

class AddOrderCard extends StatefulWidget {
  const AddOrderCard({Key? key, required this.recievedContext})
      : super(key: key);

  final BuildContext recievedContext;
  @override
  State<AddOrderCard> createState() => _AddOrderCardState();
}

class _AddOrderCardState extends State<AddOrderCard> {
  bool quickRadioSelected = false;
  bool quickShipmentSelected = false;
  bool returnOrderSelected = false;
  bool hyperlocalOrdertSelected = false;
  Color colorPrimary = const Color.fromARGB(206, 75, 33, 243);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          context: widget.recievedContext,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setModalState) => SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 30,
                          ),
                          onPressed: () =>
                              Navigator.of(widget.recievedContext).pop(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        // vertical: 10.0,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Please select what kind of order you want to add :',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setModalState(() {
                                quickShipmentSelected = true;
                                returnOrderSelected = false;
                                hyperlocalOrdertSelected = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: quickShipmentSelected
                                    ? const Color.fromARGB(45, 158, 158, 158)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.grey,
                                      child: quickShipmentSelected == true
                                          ? Padding(
                                              padding: const EdgeInsets.all(
                                                5.0,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: colorPrimary,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text(
                                          'Quick Shipment',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Create a new order to deliver your products',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setModalState(() {
                                quickShipmentSelected = false;
                                returnOrderSelected = true;
                                hyperlocalOrdertSelected = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: returnOrderSelected
                                    ? const Color.fromARGB(45, 158, 158, 158)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.grey,
                                      child: returnOrderSelected == true
                                          ? Padding(
                                              padding: const EdgeInsets.all(
                                                5.0,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: colorPrimary,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text(
                                          'Return Order',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Create a pickup for your return order',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setModalState(() {
                                quickShipmentSelected = false;
                                returnOrderSelected = false;
                                hyperlocalOrdertSelected = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: hyperlocalOrdertSelected
                                    ? const Color.fromARGB(45, 158, 158, 158)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.grey,
                                      child: hyperlocalOrdertSelected == true
                                          ? Padding(
                                              padding: const EdgeInsets.all(
                                                5.0,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: colorPrimary,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text(
                                            'Hyperlocal Order',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Create a local order for a distance upto 50 kms',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colorPrimary,
                                elevation: 0,
                              ),
                              child: const Text(
                                'Proceed',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 3,
        shadowColor: const Color.fromARGB(50, 33, 149, 243),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 40,
                color: ColorStyle.colorPrimary,
              ),
            ),
            const Text(
              'Add Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
