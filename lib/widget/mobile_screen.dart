import 'package:akash_project_predictiva_company/provider/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MobileScreen extends StatelessWidget {
  BalanceController balanceController = Get.put(BalanceController());

  MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20),
              child: Text(
                "Hi Robin,",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10.0, left: 20, bottom: 20),
                child: Text(
                  "Here is an overview of your account activities.",
                  style: TextStyle(color: Colors.white),
                )),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF3E3F48)),
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF161619),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20,
                                    top: 20,
                                    bottom: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        "Balance",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10),
                                      ),
                                    ),
                                    Text(
                                      '\$${balanceController.portfolio.value.balance}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, right: 20),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1.0,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 20,
                                      bottom: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            "Profit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          )),
                                      Row(
                                        children: [
                                          Text(
                                            '\$${balanceController.portfolio.value.profit}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10),
                                            padding: const EdgeInsets.only(
                                                left: 10.0,top: 5,bottom: 5,right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xff57171a))),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                  width: 10,
                                                  child: SvgPicture.asset(
                                                    'assets/balance_low.svg',
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6.0),
                                                  child: Text(
                                                      '${balanceController.portfolio.value.profitPercentage}% ',
                                                      style:
                                                          const TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                            0xffba0f0f),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, right: 20),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1.0,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 20,
                                      bottom: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Assets",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                      Text(
                                        '${balanceController.portfolio.value.assets}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  )),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: SvgPicture.asset(
                                        'assets/warning.svg',
                                      ),
                                    ),
                                     const Expanded(
                                       child: Padding(
                                         padding: EdgeInsets.only(left: 8.0),
                                         child: Text(
                                          "This subscription expires in a month",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                       ),
                                     ),
                                  ],
                                ),
                              )
                            ]))),
              );
            }),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF3E3F48)),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF161619),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 20),
                              child: Row(
                                children: [
                                  const Text(
                                    'Open trades',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              width: 2,
                                                color:
                                                    const Color(0xff232227))),
                                        child: InkWell(
                                          onTap: () {
                                            balanceController
                                                .toggleSortOrderList();
                                          },
                                          child: const Icon(
                                            size: 30,
                                            Icons.filter_list,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10, top: 10),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                              ),
                            ),
                            Obx(() => ListView.separated(
                              padding: EdgeInsets.zero,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: Divider(),
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      balanceController.paginatedOrders.length,
                                  itemBuilder: (ctx, index) {
                                    var order =
                                        balanceController.paginatedOrders[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                order.symbol!,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              Text(
                                                order.price.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 5.0, top: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    // Set border radius here
                                                    border: Border.all(
                                                      color: const Color(
                                                          0XFFa01718),
                                                      // Set border color here
                                                      width:
                                                          2, // Set border width here
                                                    ),
                                                  ),
                                                  child: ClipOval(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFF222126),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                30), // Set border radius here
                                                      ),
                                                      width: 40,
                                                      height: 30,
                                                      child: Center(
                                                        child: Text(
                                                          order.side!
                                                              .toLowerCase(),
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0XFFa01718),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              const Spacer(),
                                              Text(
                                                DateFormat('dd MMM, yyyy')
                                                    .format(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            order
                                                                .creationTime!)),
                                                style: const TextStyle(
                                                  color: Color(0xFFB1B1B8),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                                right: 10,
                              ),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20,top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          '${balanceController.currentRangeText}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      )),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                            color: const Color(0xff1f1e24))),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      onPressed: balanceController.previousPage,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          width: 1,
                                            color: const Color(0xff1f1e24))),
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios,
                                          size: 10, color: Colors.white),
                                      onPressed: balanceController.nextPage,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ])),
                )
          ],
        ),
      ),
    );
  }
}
