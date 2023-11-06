import 'package:admin/constants.dart';
import 'package:admin/controllers/companycontroller.dart';
import 'package:admin/controllers/providers/companyprovider.dart';
import 'package:admin/screens/components/header.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/getAllcompanies.dart';

class EmployerScreen extends StatefulWidget {
  @override
  State<EmployerScreen> createState() => _EmployerScreen();
}

class _EmployerScreen extends State<EmployerScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPaddinghight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(),
          Container(
            width: 1200,
            height: 890,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(defaultPaddinghight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Titlename(title: "Employers account management :"),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 1200,
                    height: 50,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "Active accounts",
                        ),
                        Tab(
                          text: "Accounts Requests",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 1200,
                    height: 700,
                    child: TabBarView(controller: _tabController, children: [
                      EmployerGridView(),
                      Employer(),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Employer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyController>(context);
    var filteredEmployer = provider.companiesModel.where((employers) => employers.active == 0)
        .toList();
        
    return BuildCondition(condition:filteredEmployer.isNotEmpty ,fallback: (context) => Center(child: CircularProgressIndicator(),),
      builder: (context) {
        return Column(children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: defaultPaddingwidth * 21,
              ),
              SizedBox(
                  width: 200,
                  child: Titlename3(
                    title2: 'Name',
                  )),
              SizedBox(
                  width: 280,
                  child: Titlename3(
                    title2: 'commercial register',
                  )),
              SizedBox(
                  width: 200,
                  child: Titlename3(
                    title2: 'Location',
                  )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 1200,
            height: 650,
            child: ListView.separated(
              itemCount: filteredEmployer.length,
              separatorBuilder: (context, index) {
                return const Divider(height: 40);
              },
              itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [
                    SizedBox(
                        width: defaultPaddingwidth * 15,
                        child: Image(
                          image: AssetImage("assets/images/william.png"),
                          fit: BoxFit.contain,
                          width: 50,
                          height: 50,
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(width: 250, child: Text("${filteredEmployer[index].name.obs}")),
                    SizedBox(
                        width: 250,
                        child: Text("${filteredEmployer[index].phone.obs}",
                            style: TextStyle(fontSize: 15))),
                    SizedBox(
                        width: 200, child: Text("${filteredEmployer[index].location.obs}")),
                    SizedBox(
                      width: 300,
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CompanyDetailsDialog2(
                                      filteredEmployer[index]);
                                });
                          },
                          child: Text(
                            "See more details ->",
                            style: TextStyle(color: extra, fontSize: 15),
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
        ]);
      }
    );
  }
}

class Employercardwidget extends StatelessWidget {
  final CompaniesModel employer;

  Employercardwidget({this.employer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 10, 15),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    child: Image(
                  image: AssetImage("assets/images/william.png"),
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                )),
              ],
            ),
            SizedBox(
              width: defaultPaddingwidth * 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    child: Text(employer.name,
                        style: TextStyle(
                          color: headline,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ))),
                SizedBox(
                  height: 12,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/location.svg",
                        width: 12,
                        height: 12,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          child: Text(employer.location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ]),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: SvgPicture.asset(
                        "assets/icons/email.svg",
                        width: 12,
                        height: 10,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                        child: Text(employer.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ))),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/phone.svg",
                        width: 12,
                        height: 12,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          child: Text("${employer.phone}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ))),
                      SizedBox(
                        width: 50,
                      ),
                      if (employer.easyapply == 1)
                        SizedBox(
                            child: Text("Easy apply",
                                style: TextStyle(
                                  color: fast,
                                  fontSize: 15,
                                ))),
                    ]),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // width: 300,
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CompanyDetailsDialog(employer);
                            });
                      },
                      child: Text(
                        "See more details ->",
                        style: TextStyle(color: extra, fontSize: 15),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmployerGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyController>(context);

    var activeemployer = provider.companiesModel
        .where((employers) => employers.active == 1)
        .toList();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 5 cards in each row
        childAspectRatio:
            4 / 2, // Adjust this value to change the card's aspect ratio
      ),
      itemBuilder: (BuildContext context, int index) {
        return Employercardwidget(employer: activeemployer[index]);
      },
      itemCount: activeemployer.length,
    );
  }
}

class CompanyDetailsDialog extends StatefulWidget {
  CompanyDetailsDialog(this.model);
  CompaniesModel model;

  @override
  State<CompanyDetailsDialog> createState() => _CompanyDetailsDialog();
}

class _CompanyDetailsDialog extends State<CompanyDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: 700,
            height: 500,
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 20, 40, 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Text(
                        "Profile details",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      //mainAxisAlignment: .start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: SizedBox(
                              //width: defaultPaddingwidth * 15,
                              child: Image(
                            image: AssetImage("assets/images/william.png"),
                            fit: BoxFit.contain,
                            width: 160,
                            height: 160,
                          )),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.0),
                            Text(
                              widget.model.name,
                              style: TextStyle(fontSize: 25.0, color: headline),
                            ),
                            SizedBox(height: 20.0),
                            _buildDetailText('Email:', widget.model.email),
                            SizedBox(height: 15.0),
                            _buildDetailText(
                                'Location:', widget.model.location),
                            SizedBox(height: 15.0),
                            _buildDetailText('Phone:', "${widget.model.phone}"),
                            SizedBox(height: 15.0),
                            _buildDetailText(
                                'Specialization:', widget.model.specialization),
                            SizedBox(height: 15.0),
                            _buildDetailText('Commercial Register:',
                                "${widget.model.document}"),
                            SizedBox(height: 15.0),
                            if (widget.model.easyapply == 1)
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/fast.svg",
                                    width: 12,
                                    height: 12,
                                    color: fast,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Easy Apply',
                                    style:
                                        TextStyle(fontSize: 16.0, color: fast),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(190, 0, 0, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  {
                                    AwesomeDialog(
                                      width: 400,
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: "Deleted",
                                      btnCancelText: 'done',
                                      btnCancelOnPress: () {},
                                    ).show();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 129, 38,
                                      31), // Set button color to red
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_rounded,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Delete Account',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}

class CompanyDetailsDialog2 extends StatefulWidget {
  CompanyDetailsDialog2(this.model);
  CompaniesModel model;

  @override
  State<CompanyDetailsDialog2> createState() => _CompanyDetailsDialog2();
}

class _CompanyDetailsDialog2 extends State<CompanyDetailsDialog2> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          width: 700,
          height: 500,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.all(Radius.circular(0))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 20, 40, 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: 180,
                    ),
                    Text(
                      "Profile details",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //mainAxisAlignment: .start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(
                          //width: defaultPaddingwidth * 15,
                          child: Image(
                        image: AssetImage("assets/images/william.png"),
                        fit: BoxFit.contain,
                        width: 160,
                        height: 160,
                      )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          widget.model.name,
                          style: TextStyle(fontSize: 25.0, color: headline),
                        ),
                        SizedBox(height: 20.0),
                        _buildDetailText('Email:', widget.model.email),
                        SizedBox(height: 15.0),
                        _buildDetailText('Location:', widget.model.location),
                        SizedBox(height: 15.0),
                        _buildDetailText('Phone:', "${widget.model.phone}"),
                        SizedBox(height: 15.0),
                        _buildDetailText(
                            'Specialization:', widget.model.specialization),
                        SizedBox(height: 15.0),
                        _buildDetailText(
                            'Commercial Register:', "${widget.model.document}"),
                        SizedBox(height: 15.0),
                        if (widget.model.easyapply == 1)
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/fast.svg",
                                width: 12,
                                height: 12,
                                color: fast,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Easy Apply',
                                style: TextStyle(fontSize: 16.0, color: fast),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  {
                                    CompanyController accept =
                                        CompanyController();
                                    await accept.acceptcompanies(
                                        widget.model.id, 1);
                                    AwesomeDialog(
                                      width: 400,
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title:
                                          "the company has been added successfully",
                                      btnOkOnPress: () {},
                                    ).show();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.green, // Set button color to red
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Accept Account',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  AwesomeDialog(
                                    width: 400,
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: "Deleted",
                                    btnCancelText: 'done',
                                    btnCancelOnPress: () {},
                                  ).show();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 129, 38,
                                      31), // Set button color to red
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_rounded,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Delete Account',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailText(String label, String value) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16.0),
      children: [
        TextSpan(
          text: '$label ',
          style: TextStyle(
            color: extra,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
