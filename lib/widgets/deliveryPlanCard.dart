import 'package:flutter/material.dart';

import '../utils/color.dart';

class DeliveryPlanCard extends StatefulWidget {
  const DeliveryPlanCard({
    required this.planNumber,
    required this.deliveryIn,
    required this.transactionCharges,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final int planNumber;
  final int deliveryIn;
  final double transactionCharges;
  final VoidCallback onPressed;

  @override
  State<DeliveryPlanCard> createState() => _DeliveryPlanCardState();
}

class _DeliveryPlanCardState extends State<DeliveryPlanCard> {
  bool agreedToTermsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 214, 212, 212),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: 300,
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 242, 246),
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Plan ${widget.planNumber}',
                  style: TextStyle(
                    color: ColorStyle.colorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'DELIVERED + ${widget.deliveryIn} DAYS',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('Transaction Charges'),
          SizedBox(
            height: 10,
          ),
          Text(
            '${widget.transactionCharges}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Of COD Amount',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '(GST Inclusive)',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 159, 159, 159),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Checkbox(
                  activeColor: ColorStyle.colorPrimary,
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                  value: agreedToTermsAndConditions,
                  onChanged: (newValue) {
                    setState(() {
                      agreedToTermsAndConditions = !agreedToTermsAndConditions;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    'I accept the',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: ColorStyle.colorPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: ColorStyle.colorPrimary,
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
            ),
            onPressed: agreedToTermsAndConditions ? widget.onPressed : null,
            child: Text(
              'Activate Plan ${widget.planNumber}',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
