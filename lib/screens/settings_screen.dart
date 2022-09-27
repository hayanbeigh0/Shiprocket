import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/my_icons_icons.dart';
import '/screens/account_details_screen.dart';
import '/screens/bank_account_details_screen.dart';
import '/screens/billing_address_screen.dart';
import '/screens/change_password_screen.dart';
import '/screens/courier_companies/courier_companies.dart';
import '/screens/courier_priorities.dart';
import '/screens/early_cod_screen.dart';
import '/screens/features_screen_2.dart';
import '/screens/gst_invoicing_screen.dart';
import '/screens/invoice_preferences.dart';
import '/screens/kyc_screens/kyc_screen1.dart';
import '/screens/notifications_screen.dart';
import '/screens/shipping_label_preferences.dart';
import '/screens/view_profile_screen.dart';
import 'package:shiprocket/utils/box_styles.dart';
import 'package:shiprocket/utils/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Icon icon = Icon(
    Icons.person_outline,
    color: ColorStyle.colorPrimary,
    size: 40,
  );

  String segmentTitle = 'Profile';

  String segmentDescription =
      'Update account details, company name and change password';

  VoidCallback onTap = () {};

  String subSegmentTitle = 'Profile';

  String subSegmentDescription =
      'Update account details, company name and change password';
  bool viewProfileSubSegment = false;
  bool viewBillingDetailSubSegment = false;
  bool viewRemmitanceSubSegment = false;
  bool viewCourierSubSegment = false;
  bool viewLabelsAndInvoicesSubSegment = false;
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
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            child: Container(
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
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 212, 210, 210),
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          SettingsScreenSegment(
                            icon: icon,
                            segmentTitle: segmentTitle,
                            segmentDescription: segmentDescription,
                            viewSubSegment: viewProfileSubSegment,
                            onTap: () {
                              setState(() {
                                viewProfileSubSegment = !viewProfileSubSegment;
                              });
                            },
                            subChild: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 15,
                                    bottom: 5,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Account Details',
                                    subSegmentDescription:
                                        'Edit mobile number, Shiprocket Plan',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const AccountDetails(),
                                      ));
                                    },
                                  ),
                                ),
                                const SettingsScreenSubSegmentDivider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 5,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Company Info',
                                    subSegmentDescription:
                                        'Update company name, logo, social links',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const ViewProfile(),
                                      ));
                                    },
                                  ),
                                ),
                                const SettingsScreenSubSegmentDivider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 15,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Change Password',
                                    subSegmentDescription:
                                        'Change password for Shiprocket account',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const ChangePassword(),
                                      ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              MyIcons.manifests,
                              color: ColorStyle.colorPrimary,
                              size: 30,
                            ),
                            viewSubSegment: viewBillingDetailSubSegment,
                            segmentTitle: 'Billing Details',
                            segmentDescription:
                                'Update billing address and GST Invoicing details',
                            onTap: () {
                              setState(() {
                                viewBillingDetailSubSegment =
                                    !viewBillingDetailSubSegment;
                              });
                            },
                            subChild: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19.0,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Billing Address',
                                    subSegmentDescription:
                                        'Add your Billing Address',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const BillingAddress(),
                                      ));
                                    },
                                  ),
                                ),
                                const SettingsScreenSubSegmentDivider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 15,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'GST Invoicing',
                                    subSegmentDescription: 'Add GSTIN',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const GSTInvoicing(),
                                      ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              MyIcons.cod_remmitance,
                              color: ColorStyle.colorPrimary,
                              size: 30,
                            ),
                            viewSubSegment: viewRemmitanceSubSegment,
                            segmentTitle: 'Remittance',
                            segmentDescription:
                                'Provide your bank account details and choose to opt for Earlv COD',
                            onTap: () {
                              setState(() {
                                viewRemmitanceSubSegment =
                                    !viewRemmitanceSubSegment;
                              });
                            },
                            subChild: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Bank A/C Details',
                                    subSegmentDescription:
                                        'Provide your bank details for remmitance',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const BankAccountDetails(),
                                      ));
                                    },
                                  ),
                                ),
                                const SettingsScreenSubSegmentDivider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 15,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Early COD',
                                    subSegmentDescription:
                                        'Opt for Early cod remittance',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => const EarylyCOD(),
                                      ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              Icons.location_on_outlined,
                              color: ColorStyle.colorPrimary,
                              size: 35,
                            ),
                            segmentTitle: 'Pickup Addresses',
                            segmentDescription:
                                'Add Pickup Addresses to your orders',
                            onTap: () {},
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              Icons.gif_box_outlined,
                              color: ColorStyle.colorPrimary,
                              size: 35,
                            ),
                            viewSubSegment: viewCourierSubSegment,
                            segmentTitle: 'Couriers',
                            segmentDescription:
                                'Activate or deactivate courier companies & set courier priorities',
                            onTap: () {
                              setState(() {
                                viewCourierSubSegment = !viewCourierSubSegment;
                              });
                            },
                            subChild: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Courier Companies',
                                    subSegmentDescription:
                                        'Activate or Deactivate Courier Companies',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const CourierCompanies(),
                                      ));
                                    },
                                  ),
                                ),
                                const SettingsScreenSubSegmentDivider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 12,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Set Courier Priority',
                                    subSegmentDescription:
                                        'Choose in what order you want to see the courier options',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const CourierPriorities(),
                                      ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              MyIcons.rate_us,
                              color: ColorStyle.colorPrimary,
                              size: 30,
                            ),
                            segmentTitle: 'Features',
                            segmentDescription:
                                'Set your priorities for features',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Features2(),
                              ));
                            },
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              MyIcons.manifests,
                              color: ColorStyle.colorPrimary,
                              size: 30,
                            ),
                            viewSubSegment: viewLabelsAndInvoicesSubSegment,
                            segmentTitle: 'Labels & Invoices',
                            segmentDescription:
                                'Customize your labels and invoices',
                            onTap: () {
                              setState(() {
                                viewLabelsAndInvoicesSubSegment =
                                    !viewLabelsAndInvoicesSubSegment;
                              });
                            },
                            subChild: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle:
                                        'Set Shipping Label Preferences',
                                    subSegmentDescription:
                                        'Customize how your label will look',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const ShippingLabelPreferences(),
                                      ));
                                    },
                                  ),
                                ),
                                const SettingsScreenSubSegmentDivider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19.0,
                                    right: 19,
                                    top: 8,
                                    bottom: 12,
                                  ),
                                  child: SettingsScreenSubSegment(
                                    subSegmentTitle: 'Set Invoice Preferences',
                                    subSegmentDescription:
                                        'Customize the information for your invoices',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const InvoicePreferences(),
                                      ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              MyIcons.privacy_policy,
                              color: ColorStyle.colorPrimary,
                              size: 30,
                            ),
                            segmentTitle: 'KYC',
                            segmentDescription:
                                'Complete your kyc verification for seamless shipping',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const KYCScreen1(),
                              ));
                            },
                          ),
                          SettingsScreenSegment(
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: ColorStyle.colorPrimary,
                              size: 35,
                            ),
                            segmentTitle: 'Notifications',
                            segmentDescription:
                                'Select what kind of notifications you would like to receive',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Notifications(),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SettingsScreenSubSegmentDivider extends StatelessWidget {
  const SettingsScreenSubSegmentDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 19.0,
        right: 45,
      ),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}

class SettingsScreenSubSegment extends StatelessWidget {
  const SettingsScreenSubSegment({
    Key? key,
    required this.subSegmentTitle,
    required this.subSegmentDescription,
    required this.onTap,
  }) : super(key: key);

  final String subSegmentTitle;
  final String subSegmentDescription;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subSegmentTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subSegmentDescription,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 87, 87, 87),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: Color.fromARGB(255, 155, 154, 154),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreenSegment extends StatelessWidget {
  SettingsScreenSegment({
    Key? key,
    required this.icon,
    required this.segmentTitle,
    required this.segmentDescription,
    required this.onTap,
    this.viewSubSegment = false,
    this.subChild = const SizedBox(),
  }) : super(key: key);
  final Widget subChild;
  final Icon icon;
  final String segmentTitle;
  final String segmentDescription;
  final VoidCallback onTap;
  bool viewSubSegment = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 6,
                ),
                width: 45,
                child: icon,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                segmentTitle,
                                style: const TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 25, 25, 25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                segmentDescription,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 87, 87, 87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Transform.rotate(
                              angle: viewSubSegment ? -3.14 / 2 : 0,
                              child: const SizedBox(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  CupertinoIcons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    viewSubSegment
                        ? Container(
                            // height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(119, 215, 216, 246),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            margin: const EdgeInsets.only(
                              top: 4,
                              right: 5,
                            ),
                            child: subChild,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
