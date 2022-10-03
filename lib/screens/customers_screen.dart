import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/provider/added_customer.dart';
import 'package:shiprocket/screens/add_customer_screen.dart';
import 'package:shiprocket/screens/customer_detail.dart';
// import 'package:shiprocket/screens/customer_detail_screen.dart';
import 'package:shiprocket/utils/color.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerListProvider =
        Provider.of<AddedCustomerProvider>(context).addedCustomers;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(43, 82, 121, 247),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Color.fromARGB(136, 0, 0, 0),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Customers',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(0, 100),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(50, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search for Name, Email or Phone Number',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 111, 111, 112),
                            fontSize: 10,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          customerListProvider.isEmpty
              ? Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      'assets/no-customer.jpeg',
                      fit: BoxFit.fitWidth,
                    ),
                    const Text(
                      'No customers found',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 12.0,
                        ),
                        backgroundColor: ColorStyle.colorPrimary,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddCustomer(),
                          ),
                        );
                      },
                      child: const Text('Add Your First Customer'),
                    ),
                  ],
                )
              : Expanded(
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
                          0.25,
                          0.25,
                          1.0,
                        ],
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: customerListProvider.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CustomerDetailScreen(
                                index: index,
                              ),
                            ),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                7.0,
                              ),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 15.0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 45,
                                              padding: const EdgeInsets.only(
                                                top: 12.0,
                                                bottom: 12.0,
                                                left: 21,
                                                right: 3,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    15, 75, 33, 243),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 65,
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        '${customerListProvider[index].firstName} ${customerListProvider[index].lastName}',
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    const VerticalDivider(
                                                      color: Colors.grey,
                                                      thickness: 2,
                                                    ),
                                                    Text(
                                                      customerListProvider[
                                                              index]
                                                          .phoneNumber,
                                                      style: const TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              child: Transform.translate(
                                                offset: const Offset(-17, 0),
                                                child: CircleAvatar(
                                                  radius: 16,
                                                  child: Text(
                                                    customerListProvider[index]
                                                        .firstName[0],
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor:
                                                ColorStyle.colorPrimary,
                                            padding: const EdgeInsets.all(12.0),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'Add Order',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Created at:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        customerListProvider[index].createdAt,
                                        style: const TextStyle(
                                          fontSize: 14.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddCustomer(),
            ),
          );
        },
        backgroundColor: Colors.white,
        elevation: 8,
        child: Icon(
          Icons.add,
          size: 40,
          color: ColorStyle.colorPrimary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
