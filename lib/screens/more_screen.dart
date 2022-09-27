import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/my_icons_icons.dart';
import 'package:shiprocket/screens/about_shiprocket.dart';
import 'package:shiprocket/screens/channel_integrations/integrate_other_channels.dart';
import 'package:shiprocket/screens/channel_integrations/integrate_with_shopify.dart';
import 'package:shiprocket/screens/cod_remmitance.dart';
import 'package:shiprocket/screens/customers_screen.dart';
import 'package:shiprocket/screens/dashboard_screen/dashboard_screen.dart';
import 'package:shiprocket/screens/dashboard_screen/weight_discrepancies.dart';
import 'package:shiprocket/screens/faq_screen.dart';
import 'package:shiprocket/screens/help_and_support_screen/help_and_support.dart';
import 'package:shiprocket/screens/manifests_screen.dart';
import 'package:shiprocket/screens/refer_and_earn.dart';
import 'package:shiprocket/screens/settings_screen.dart';
import 'package:shiprocket/screens/share_feedback.dart';
import 'package:shiprocket/screens/shiprocket_trainings.dart';
import 'package:shiprocket/screens/signup_screen.dart';
import 'package:shiprocket/screens/upgrade_plan.dart';
import 'package:shiprocket/screens/view_profile_screen.dart';
import 'package:shiprocket/screens/wallet_and_passbook_screen.dart/wallet_passbook_tab.dart';
import 'package:shiprocket/screens/weight_discrepancy.dart';
import 'package:shiprocket/utils/color.dart';

import 'invoices/invoices.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final String userFullName = 'Hayan Beigh';

  final String iconPath = 'assets/icons/apps.svg';

  final String itemName = 'Dashboard';

  bool iconCustomerSupprt = false;
  bool iconChannelIntegration = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                  ),
                  radius: 40,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userFullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.badge,
                          color: Color(0xFFCD7F32),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'BRONZE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(105, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ViewProfile(),
                          ),
                        );
                      },
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          fontSize: 14.5,
                          color: Color.fromARGB(197, 87, 39, 176),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(20, 33, 149, 243),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 5,
                  top: 3,
                  bottom: 3,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'KAM Name: ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Customer Support',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            iconCustomerSupprt
                                ? CupertinoIcons.chevron_up
                                : CupertinoIcons.chevron_down,
                            size: 20,
                            color: const Color.fromARGB(127, 0, 0, 0),
                          ),
                          onPressed: () {
                            setState(() {
                              iconCustomerSupprt = !iconCustomerSupprt;
                            });
                          },
                        ),
                      ],
                    ),
                    iconCustomerSupprt == true
                        ? Column(
                            children: [
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email_outlined,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Text('Email ID: '),
                                      Text(
                                        'support@shiprocket.com',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(212, 87, 39, 176),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
              ),
              child: const OptionListItem(
                itemName: 'Dashboard',
                iconData: MyIcons.th_large_outline,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CustomersScreen(),
                ),
              ),
              child: const OptionListItem(
                itemName: 'Customers',
                iconData: MyIcons.customers,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WalletAndPassbookTab(),
              )),
              child: const OptionListItem(
                itemName: 'Wallet & Passbook',
                iconData: MyIcons.wallet_and_passbook,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WeightDiscrepancy(),
              )),
              child: const OptionListItem(
                itemName: 'Weight Discrepencies',
                iconData: MyIcons.weight_descrepancies,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Manifests(),
              )),
              child: const OptionListItem(
                itemName: 'Manifests',
                iconData: MyIcons.manifests,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      children: const [
                        Icon(
                          MyIcons.channel_integrations,
                          size: 25,
                          color: Color.fromARGB(212, 87, 39, 176),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    iconChannelIntegration =
                                        !iconChannelIntegration;
                                  });
                                },
                                child: const Text(
                                  'Channel Integrations',
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(150, 0, 0, 0),
                                  ),
                                ),
                              ),
                              // const Spacer(),
                              IconButton(
                                icon: Icon(
                                  iconChannelIntegration
                                      ? CupertinoIcons.chevron_up
                                      : CupertinoIcons.chevron_down,
                                  size: 20,
                                  color: const Color.fromARGB(127, 0, 0, 0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    iconChannelIntegration =
                                        !iconChannelIntegration;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        iconChannelIntegration
                            ? Padding(
                                padding: const EdgeInsets.only(right: 13.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color:
                                        const Color.fromARGB(10, 33, 149, 243),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                IntegrateWithShopify(),
                                          ));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: Colors.transparent,
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: const [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.backpack,
                                                size: 25,
                                                color: Color.fromARGB(
                                                    212, 87, 39, 176),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Integrate with shopify',
                                                style: TextStyle(
                                                  fontSize: 14.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      150, 0, 0, 0),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                CupertinoIcons.chevron_forward,
                                                color: Color.fromARGB(
                                                    212, 87, 39, 176),
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                IntegrateOtherChannels(),
                                          ));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: const [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                MyIcons.th_large_outline,
                                                size: 25,
                                                color: Color.fromARGB(
                                                    212, 87, 39, 176),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Integrate other channels',
                                                style: TextStyle(
                                                  fontSize: 14.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      150, 0, 0, 0),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                CupertinoIcons.chevron_forward,
                                                color: Color.fromARGB(
                                                    212, 87, 39, 176),
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 07.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Invoices(),
                ));
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                child: const OptionListItem(
                  itemName: 'Invoices',
                  iconData: MyIcons.manifests,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CODRemmitance(),
              )),
              child: const OptionListItem(
                itemName: 'COD Remittance',
                iconData: MyIcons.cod_remmitance,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              child: const OptionListItem(
                itemName: 'Settings',
                iconData: MyIcons.settings,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReferAndEarn(),
              )),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                child: const OptionListItem(
                  itemName: 'Refer & Earn',
                  iconData: MyIcons.refer_and_earn,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpgradePlan(),
                ));
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                child: const OptionListItem(
                  itemName: 'Upgrade Plan',
                  iconData: MyIcons.upgrade_plan,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShipRocketTrainings(),
                ));
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                child: const OptionListItem(
                  itemName: 'Shiprocket Training',
                  iconData: MyIcons.customers,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 07.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FAQ(),
                ),
              ),
              child: const OptionListItem(
                itemName: 'Help & Support',
                iconData: MyIcons.help_and_support,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HelpAndSupport(),
                ),
              ),
              child: const OptionListItem(
                itemName: 'FAQ',
                iconData: MyIcons.faq,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const OptionListItem(
              itemName: 'Privacy Policy',
              iconData: MyIcons.privacy_policy,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutShiprocket(),
                ),
              ),
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: const OptionListItem(
                  itemName: 'About Shiprocket',
                  iconData: Icons.info_outline,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShareFeedback(),
                ));
              },
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: const OptionListItem(
                  itemName: 'Share Feedback',
                  iconData: MyIcons.share_feedback,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentPadding: EdgeInsets.all(10),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(),
                            SizedBox(
                              height: 120,
                              child: Image.asset(
                                  'assets/shiprocket-rating-image.PNG'),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.close),
                            ),
                          ],
                        ),
                        Text(
                          'Enjoying Shiprocket?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 45,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(
                                      color: ColorStyle.colorPrimary,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Not really',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorStyle.colorPrimary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 110,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorStyle.colorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Yes!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: const OptionListItem(
                  itemName: 'Rate Us',
                  iconData: MyIcons.rate_us,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: const OptionListItem(
                  itemName: 'Logout',
                  iconData: MyIcons.logout,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionListItem extends StatelessWidget {
  const OptionListItem({
    Key? key,
    required this.itemName,
    required this.iconData,
  }) : super(key: key);

  final String itemName;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 25,
            color: const Color.fromARGB(212, 87, 39, 176),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            itemName,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(150, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
