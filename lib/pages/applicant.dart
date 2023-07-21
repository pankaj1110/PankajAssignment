import 'package:applicant_assignments/constants/color.dart';
import 'package:applicant_assignments/controllers/calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/app_bar.dart';
import '../models/attendance_details_model.dart';

class Applicant extends StatefulWidget {
  const Applicant({super.key});

  @override
  State<Applicant> createState() => _ApplicantState();
}

class _ApplicantState extends State<Applicant> {
  List<DeliveryDetails> deliveryList = [
    DeliveryDetails(
      dayDate: "Friday 08-03-2023",
      dropperBy: "Mr. Sunil Patil",
      pickedBy: "Mrs. Swati Patil",
      droppedTime: "8:24 AM",
      pickedTime: "12:03 PM",
    ),
    DeliveryDetails(
      dayDate: "Friday 08-03-2023",
      dropperBy: "John Doe",
      pickedBy: "Jane Smith",
      droppedTime: "10:00 AM",
      pickedTime: "12:03 PM",
    ),
    DeliveryDetails(
      dayDate: "Friday 08-03-2023",
      dropperBy: "John Doe",
      pickedBy: "Jane Smith",
      droppedTime: "10:00 AM",
      pickedTime: "12:03 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Attendance',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        "Yay! Ruchika is present today",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Image.asset(
                      'assets/images/turtle.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            calendar(),
            Tabs(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Attendance Details",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: deliveryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey.shade100,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  deliveryList[index].dayDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SvgPicture.asset(
                                  "assets/svgs/check.svg",
                                ),
                              ],
                            ),
                            Text(
                              "Arrived on time",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dropper By - ${deliveryList[index].dropperBy}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '- ${deliveryList[index].droppedTime}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Picked up by -  ${deliveryList[index].pickedBy}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '- ${deliveryList[index].pickedTime}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class calendar extends StatelessWidget {
  const calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CalenderController ccontroller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${DateFormat('MMMM').format(DateTime.now())}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SvgPicture.asset(
                'assets/svgs/dropDown.svg',
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/svgs/calendar.svg',
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade100,
            ),
            height: size.height * .13,
            child: Center(
              child: ScrollablePositionedList.builder(
                itemScrollController: ccontroller.itemcontroller,
                // itemPositionsListener: ccontroller.itemlistner,
                itemCount: ccontroller.dates.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => Center(
                        child: GestureDetector(
                          onTap: () {
                            ccontroller.onDateChanged(index);
                            ccontroller.scrollToItem(index);
                          },
                          child: Container(
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.circular(size.height * .04),
                            ),
                            // elevation:
                            //     ? 20
                            //     : 3,

                            margin: EdgeInsets.symmetric(
                                // vertical: size.height * .01,
                                horizontal: size.width * .018),
                            child: Center(
                              child: SizedBox(
                                // height: size.height * .03,
                                width: size.width * .1,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        ccontroller.days[index].toString()[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: ccontroller.days[index]
                                                          .toString()[0] ==
                                                      "S"
                                                  ? Colors.red
                                                  : Colors.grey.shade600,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ccontroller
                                                      .seletedDateindex.value ==
                                                  index
                                              ? AppColors.purple
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          ccontroller.dates[index].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: ccontroller.days[index]
                                                            .toString()[0] ==
                                                        "S"
                                                    ? Colors.red
                                                    : Colors.black,
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            )),
      ],
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Ruchika's Presence",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          tabs: [
            Tab(text: 'This Week'),
            Tab(text: 'This Month'),
          ],
        ),
        SizedBox(
          height: size.height * 0.15,
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Present",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.darkGrey,
                                    fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "04",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .1,
                        child: VerticalDivider(
                          endIndent: 15,
                          indent: 15,
                          thickness: 1.5,
                          width: 1,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Absent",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.darkGrey,
                                    fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "01",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .1,
                        child: VerticalDivider(
                          endIndent: 15,
                          indent: 15,
                          thickness: 1.5,
                          width: 1,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Percentage",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: AppColors.darkGrey,
                                    fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "90%",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  )),
                ),
              ),
              Center(
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
