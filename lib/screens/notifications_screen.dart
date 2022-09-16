import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';
import 'package:shiprocket/widgets/common_top_bar.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonTopBar(title: 'Notifications'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Finance/Accounts',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
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
                          0.1,
                          0.1,
                          1.0,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 210, 210, 210),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Following email IDs and mobile numbers will receive Business (ex- COD remittance etc.) related notifications',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 90,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        const Color.fromARGB(78, 215, 216, 246),
                                    borderColor: Colors.transparent,
                                    textForm: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        label: Row(
                                          children: const [
                                            Text(
                                              'Email ID',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    187, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              ' (Optional)',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 90,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        const Color.fromARGB(78, 215, 216, 246),
                                    borderColor: Colors.transparent,
                                    textForm: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        label: Row(
                                          children: const [
                                            Text(
                                              'Mobile Number',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    187, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              ' (Optional)',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            'Operations',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 210, 210, 210),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Following email IDs and mobile numbers will receive Operations (ex- label, order, invoice, NDR etc.) related notifications',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 90,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        const Color.fromARGB(78, 215, 216, 246),
                                    borderColor: Colors.transparent,
                                    textForm: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        label: Row(
                                          children: const [
                                            Text(
                                              'Email ID',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    187, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              ' (Optional)',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 90,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        const Color.fromARGB(78, 215, 216, 246),
                                    borderColor: Colors.transparent,
                                    textForm: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        label: Row(
                                          children: const [
                                            Text(
                                              'Mobile Number',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    187, 0, 0, 0),
                                              ),
                                            ),
                                            Text(
                                              ' (Optional)',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorStyle.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
