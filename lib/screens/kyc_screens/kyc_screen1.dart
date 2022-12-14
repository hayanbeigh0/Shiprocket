import 'package:flutter/material.dart';
import 'package:shiprocket/screens/kyc_screens/kyc_screen2.dart';
import 'package:shiprocket/utils/box_styles.dart';
import 'package:shiprocket/utils/color.dart';

class KYCScreen1 extends StatefulWidget {
  const KYCScreen1({super.key});

  @override
  State<KYCScreen1> createState() => _KYCScreen1State();
}

class _KYCScreen1State extends State<KYCScreen1> {
  bool soleProprietorshipSelected = false;

  bool individualSelected = false;

  bool companySelected = false;

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
                const Text(
                  'KYC',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
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
              child: Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.transparent,
                            child: const Text(
                              'Step 1/3 - Business Structure',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(74, 158, 158, 158),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 12,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 1 / 3,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: ColorStyle.colorPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 203, 202, 202),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(16, 0, 0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 20.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Please Confirm Your Business Structure:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        individualSelected = true;
                                        companySelected = false;
                                        soleProprietorshipSelected = false;
                                      });
                                    },
                                    child: BusinessStructure(
                                      businessStructureType: 'Individual',
                                      businessStructureTypeDescription:
                                          'A seller who is selling through online social platforms, and has not registered his/her firm under Companies Act 2013.',
                                      isSelected: individualSelected,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        individualSelected = false;
                                        companySelected = false;
                                        soleProprietorshipSelected = true;
                                      });
                                    },
                                    child: BusinessStructure(
                                      businessStructureType:
                                          'Sole Proprietorship',
                                      businessStructureTypeDescription:
                                          'Registered company as "Sole Proprietor" under companies Act 2013',
                                      isSelected: soleProprietorshipSelected,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        individualSelected = false;
                                        companySelected = true;
                                        soleProprietorshipSelected = false;
                                      });
                                    },
                                    child: BusinessStructure(
                                      businessStructureType: 'Company',
                                      businessStructureTypeDescription:
                                          'Registered company as "LLP", "Private", "Public", "Subsidiary", "holding", etc, under companies Act 2013.',
                                      isSelected: companySelected,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorStyle.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => KYCScreen2(),
                              ));
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        individualSelected == false &&
                                companySelected == false &&
                                soleProprietorshipSelected == false
                            ? Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(66, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 55,
                                width: double.infinity,
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessStructure extends StatelessWidget {
  const BusinessStructure({
    Key? key,
    required this.businessStructureType,
    required this.businessStructureTypeDescription,
    required this.isSelected,
  }) : super(key: key);
  final String businessStructureType;
  final String businessStructureTypeDescription;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 11,
            backgroundColor: const Color.fromARGB(
              255,
              207,
              205,
              205,
            ),
            child: isSelected
                ? CircleAvatar(
                    radius: 6,
                    backgroundColor: ColorStyle.colorPrimary,
                  )
                : const SizedBox(),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  businessStructureType,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  businessStructureTypeDescription,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
