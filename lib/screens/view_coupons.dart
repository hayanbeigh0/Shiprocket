import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/models/coupon_model.dart';
import 'package:shiprocket/utils/color.dart';
import 'package:shiprocket/widgets/common_top_bar.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

class ViewCoupons extends StatelessWidget {
  ViewCoupons({super.key});
  List<CouponModel> coupons = [
    CouponModel(
      cashbackAmount: '250',
      minimumRechargeAmount: '500',
      expiry: '30 Sep, 2022, 11:59 PM',
    ),
    CouponModel(
      cashbackAmount: '600',
      minimumRechargeAmount: '1000',
      expiry: '30 Sep, 2022, 11:59 PM',
    ),
  ];

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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: coupons.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                DottedBorder(
                                  padding: EdgeInsets.zero,
                                  borderType: BorderType.Rect,
                                  strokeWidth: 1.3,
                                  dashPattern: [5],
                                  radius: Radius.circular(8),
                                  color: ColorStyle.colorPrimary,
                                  child: Container(
                                    color: Color.fromARGB(13, 51, 41, 100),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          'FLAT${coupons[index].cashbackAmount}',
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox()
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Get ₹ ${coupons[index].cashbackAmount} Flat Cashback on a minimum recharge of ₹ ${coupons[index].minimumRechargeAmount}.',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'Coupon Expires On: ${coupons[index].expiry}',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '*T&C Apply',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorStyle.colorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 10,
                        ),
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: ColorStyle.colorPrimary,
                          ),
                        ),
                      )
                    ],
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
