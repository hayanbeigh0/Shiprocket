import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

import '../widgets/common_top_bar.dart';

class ShareFeedback extends StatelessWidget {
  const ShareFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonTopBar(title: 'Share Feedback'),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: Color.fromARGB(255, 213, 212, 212),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'We would love to hear your feedback',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormFieldContainer(
                          textForm: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Email',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          child: TextFormFieldContainer(
                            textForm: TextField(
                              minLines: 10,
                              maxLines: 11,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Feedback',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyle.colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
