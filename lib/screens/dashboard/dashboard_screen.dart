import 'package:admin/constants.dart';
import 'package:admin/controllers/companycontroller.dart';
import 'package:admin/controllers/providers/companyprovider.dart';
import 'package:admin/screens/components/header.dart';
import 'package:admin/screens/jobs/jobposts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controllers/jobs_controller.dart';
import '../employers/employers_screen.dart';
import '../jobs/jobs_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
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
          SizedBox(
            width: 1000,
            child: Container(
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.all(defaultPaddinghight),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(child: Titlename(title: "Total Users : ")),
                        SizedBox(
                          height: defaultPaddinghight * 2,
                        ),
                        SizedBox(
                            child: Titlename(title: "This week Updates : ")),
                        SizedBox(
                          height: defaultPaddinghight,
                        ),
                        SizedBox(
                          height: defaultPaddinghight,
                        ),
                        SizedBox(child: Titlename(title: "Requests : ")),
                        SizedBox(
                          height: defaultPaddinghight,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  Titlename(title: "In Total : "),

                          SizedBox(
                            child: Updates(
                                svgpic: "assets/icons/employers.svg",
                                name: "Employer accounts",
                                num: "2"),
                          ),
                          SizedBox(
                            height: defaultPaddinghight * 2.5,
                          ),
                          //   Titlename(title: "This week Updates : "),

                          SizedBox(
                            child: Updates(
                                svgpic: "assets/icons/employers.svg",
                                name: "New Employer account",
                                num: "20 "),
                          ),
                          SizedBox(
                            height: defaultPaddinghight * 2,
                          ),
                          // Titlename(title: "Requests : "),

                          SizedBox(
                            child: Updates(
                              svgpic: "assets/icons/employers.svg",
                              num: "20 ",
                              name: "Employer accounts request",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Updates(
                                svgpic: "assets/icons/job.svg",
                                name: "Job Posts",
                                num: "60k+ "),
                          ),
                          SizedBox(
                            height: defaultPaddinghight * 2.5,
                          ),
                          SizedBox(
                            child: Updates(
                                svgpic: "assets/icons/job.svg",
                                name: "New Job Posts",
                                num: "200 "),
                          ),
                          SizedBox(
                            height: defaultPaddinghight * 2,
                          ),
                          SizedBox(
                            child: Updates(
                              svgpic: "assets/icons/job.svg",
                              num: "100 ",
                              name: "Job post request",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Updates(
                                svgpic: "assets/icons/person.svg",
                                name: "Employee accounts",
                                num: "2k+ "),
                          ),
                          SizedBox(
                            height: defaultPaddinghight * 2.5,
                          ),
                          SizedBox(
                            child: Updates(
                                svgpic: "assets/icons/employers.svg",
                                name: "New employee account",
                                num: "500 "),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 1200,
            height: 650,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(defaultPaddinghight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Titlename(title: "Recent requests :"),
                  Container(
                    width: 1200,
                    height: 50,
                    child: TabBar(
                      indicatorColor: secondaryColor,
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "Employers",
                        ),
                        Tab(
                          text: "Job Posts",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 1200,
                    height: 500,
                    child: TabBarView(controller: _tabController, children: [
                      Employer(),
                      JopPost(),
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
  const Employer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyController>(context);
    var filteredEmployer =
        provider.companiesModel.where((employers) => employers.active == 0).toList();

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
                title2: 'Location ',
              )),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        width: 1200,
        height: 450,
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
                SizedBox(width: 250, child: Text(filteredEmployer[index].name)),
                SizedBox(
                    width: 250,
                    child: Text("${filteredEmployer[index].phone}")),
                SizedBox(
                    width: 200, child: Text(filteredEmployer[index].location)),
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
}

class JopPost extends StatelessWidget {
  const JopPost({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
       final provider = Provider.of<JobController>(context);
     var acceptjobs = provider.jobModel
        .where((job) => job.accept == 0)
        .toList();

    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: defaultPaddingwidth * 21,
          ),
          SizedBox(
              width: 250,
              child: Titlename3(
                title2: 'Position',
              )),
          SizedBox(
              width: 230,
              child: Titlename3(
                title2: 'Location',
              )),
          SizedBox(
              width: 150,
              child: Titlename3(
                title2: 'Job type ',
              )),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        width: 1200,
        height: 450,
        child: ListView.separated(
          itemCount: acceptjobs.length,
          separatorBuilder: (context, index) {
            return const Divider(height: 40);
          },
          itemBuilder: (BuildContext context, index) {
            return Row(
              children: [
                SizedBox(
                    width: defaultPaddingwidth * 15,
                    child: Image(
                      image: AssetImage(data.logo),
                      fit: BoxFit.contain,
                      width: 50,
                      height: 50,
                    )),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                    width: 250, child: Text(acceptjobs[index].jobTitle)),
                SizedBox(width: 250, child: Text(acceptjobs[index].company.name)),
                if (acceptjobs[index].workTypeId == 1)
                  SizedBox(width: 200, child: Text("in office")),
                if (acceptjobs[index].workTypeId != 1)
                  SizedBox(width: 200, child: Text("Remotly")),
                SizedBox(
                  width: 300,
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return JobDetailsDialog2(acceptjobs[index]);
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
}

class Updates extends StatelessWidget {
  const Updates({
    @required this.svgpic,
    @required this.name,
    @required this.num,
    Key key,
  }) : super(key: key);
  final String name, svgpic, num;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgpic,
          width: 18,
          height: 18,
          color: primaryColor,
        ),
        SizedBox(
          width: defaultPaddingwidth,
        ),
        Text(num,
            style: TextStyle(
                color: fast, fontSize: 15, fontWeight: FontWeight.w900)),
        // ignore: missing_required_param
        Text(
          name,
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}
