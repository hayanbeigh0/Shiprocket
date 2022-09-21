import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';
import 'package:shiprocket/widgets/common_top_bar.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

class ViewCoupons extends StatelessWidget {
  const ViewCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonTopBar(title: 'View Offers'),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Center(
              child: TextFormFieldContainer(
                borderColor: Colors.transparent,
                backgroundColor: Color.fromARGB(255, 233, 232, 232),
                textForm: TextField(
                  decoration: InputDecoration(
                    suffixText: 'Apply',
                    suffixStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorStyle.colorPrimary,
                    ),
                    enabledBorder: InputBorder.none,
                    hintText: 'Enter Coupon Code',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
