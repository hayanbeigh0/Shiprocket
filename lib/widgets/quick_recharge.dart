import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiprocket/utils/color.dart';

import '../screens/view_coupons.dart';
import 'add_money.dart';

class QuickRecharge extends StatefulWidget {
  const QuickRecharge({
    Key? key,
  }) : super(key: key);

  @override
  State<QuickRecharge> createState() => _QuickRechargeState();
}

class _QuickRechargeState extends State<QuickRecharge> {
  final Color colorPrimary = ColorStyle.colorPrimary;

  final Color colorPrimaryExtraLight = const Color.fromARGB(6, 75, 33, 243);

  final Color colorPrimaryLight = const Color.fromARGB(191, 75, 33, 243);

  int initailRechargeAmount = 500;

  TextEditingController rechargeAmountController = TextEditingController();
  @override
  void initState() {
    rechargeAmountController.text = initailRechargeAmount.toString();
    super.initState();
  }

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
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setmodalState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            size: 60,
                            color: colorPrimary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Recharge Wallet',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Add Amount',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          color: const Color.fromARGB(53, 158, 158, 158),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                            controller: rechargeAmountController,
                            textInputAction: TextInputAction.next,
                            readOnly: true,
                            // enabled: false,

                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setmodalState(() {
                                    val = int.parse(
                                        rechargeAmountController.text);
                                    val = 500;
                                    rechargeAmountController.text =
                                        val.toString();
                                  });
                                },
                              ),
                              prefixIcon: SizedBox(
                                width: 80,
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '₹',
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: VerticalDivider(
                                          color:
                                              Color.fromARGB(255, 53, 52, 52),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 111, 111, 112),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                            cursorHeight: 25,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.deny(
                                RegExp(r'\s'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Minimum recharge value is ₹500 and maximum recharge value is ₹50 Lakhs',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 45,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          AddMoney(
                            onPressed: () {
                              _add100(setmodalState);
                            },
                            amount: '₹100',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AddMoney(
                            onPressed: () {
                              _add500(setmodalState);
                            },
                            amount: '₹500',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AddMoney(
                            onPressed: () {
                              _add1000(setmodalState);
                            },
                            amount: '₹1000',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AddMoney(
                            onPressed: () {
                              _add5000(setmodalState);
                            },
                            amount: '₹5000',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: colorPrimaryExtraLight,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.badge,
                            color: colorPrimary,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Select coupon code',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewCoupons(),
                              ));
                            },
                            child: Text(
                              'View Coupons',
                              style: TextStyle(
                                fontSize: 16,
                                color: colorPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: colorPrimaryLight,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Add Money',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
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
                Icons.wallet_outlined,
                size: 40,
                color: colorPrimary,
              ),
            ),
            const Text(
              'Quick Recharge',
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

  late int val;

  void _add5000(StateSetter setmodalState) {
    setmodalState(() {
      val = int.parse(rechargeAmountController.text);
      val += 5000;
      rechargeAmountController.text = val.toString();
    });
  }

  void _add500(StateSetter setmodalState) {
    setmodalState(() {
      val = int.parse(rechargeAmountController.text);
      val += 500;
      rechargeAmountController.text = val.toString();
    });
  }

  void _add100(StateSetter setmodalState) {
    setmodalState(() {
      val = int.parse(rechargeAmountController.text);
      val += 100;
      rechargeAmountController.text = val.toString();
    });
  }

  void _add1000(StateSetter setmodalState) {
    setmodalState(() {
      val = int.parse(rechargeAmountController.text);
      val += 1000;
      rechargeAmountController.text = val.toString();
    });
  }
}
