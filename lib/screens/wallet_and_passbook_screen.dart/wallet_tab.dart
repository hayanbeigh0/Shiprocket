import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import '../../utils/color.dart';
import '../../widgets/add_money.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  int initailRechargeAmount = 500;

  TextEditingController rechargeAmountController = TextEditingController();
  @override
  void initState() {
    rechargeAmountController.text = initailRechargeAmount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: const EdgeInsets.all(
              10.0,
            ),
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
                  0.15,
                  0.15,
                  1.0,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      child: Transform.translate(
                        offset: const Offset(0, -35),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color.fromARGB(255, 224, 223, 223),
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 235, 233, 233),
                            radius: 35,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 34,
                              child: Icon(
                                Icons.wallet_outlined,
                                color: ColorStyle.colorPrimary,
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // elevation: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 4,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 6), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Wallet Balance',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '₹0.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'Amount On Hold',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '₹0.00',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(
                              color: Colors.grey,
                              height: 5,
                            ),
                          ),
                          const Text(
                            'Usable Balance',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₹0.00',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 27.0),
                            child: Text(
                              'You must maintain the minimum balance of Rs. 100 in your wallet to ship an order.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 100, 99, 99),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'View Transaction History',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: ColorStyle.colorPrimary,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      child: Transform.translate(
                        offset: const Offset(0, -35),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 235, 233, 233),
                            radius: 35,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 34,
                              child: Icon(
                                Icons.wallet_outlined,
                                color: ColorStyle.colorPrimary,
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Add Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
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
                                    setState(() {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                _add100(setState);
                              },
                              amount: '₹100',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AddMoney(
                              onPressed: () {
                                _add500(setState);
                              },
                              amount: '₹500',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AddMoney(
                              onPressed: () {
                                _add1000(setState);
                              },
                              amount: '₹1000',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AddMoney(
                              onPressed: () {
                                _add5000(setState);
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorStyle.colorPrimaryExtraLight100,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.badge,
                                color: ColorStyle.colorPrimary,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Select coupon code',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'View Coupons',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorStyle.colorPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ColorStyle.colorPrimaryLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Last 3 Transactions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                  child: const SizedBox(
                    height: 140,
                    child: Center(
                      child: Text(
                        'No Record Found',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 111, 111),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
