import 'package:flutter/material.dart';

import '../../widgets/text_form_field_container.dart';

class CreateTickets extends StatelessWidget {
  CreateTickets({super.key});
  final items = ['Primary'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 20.0,
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormFieldContainer(
                      textForm: DropdownButtonFormField(
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
                        decoration: const InputDecoration(
                          labelText: 'Select Category',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 111, 111, 112),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Subcategory',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormFieldContainer(
                      textForm: DropdownButtonFormField(
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
                        decoration: const InputDecoration(
                          labelText: 'Select Sub Category',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 111, 111, 112),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
