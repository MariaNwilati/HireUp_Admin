import 'package:admin/constants.dart';
import 'package:admin/controllers/jobs_controller.dart';
import 'package:admin/models/getAlljobs.dart';
import 'package:admin/screens/components/header.dart';
import 'package:admin/screens/jobs/jobposts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class JobScreen extends StatefulWidget {
  @override
  State<JobScreen> createState() => _JobScreen();
}

class _JobScreen extends State<JobScreen> with TickerProviderStateMixin {
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
            height: 600,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(defaultPaddinghight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Titlename(title: "Jobs Posts management :"),
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
                          text: "Published",
                        ),
                        Tab(
                          text: "Posts request",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 1200,
                    height: 420,
                    child: TabBarView(controller: _tabController, children: [
                      JobGridView(),
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
                title2: 'Job type',
              )),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
          width: 1200,
          height: 370,
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
                    ),
                  ),
                  SizedBox(width: 50),
                  SizedBox(
                      width: 250, child: Text(acceptjobs[index].jobTitle)),
                  SizedBox(
                      width: 250, child: Text(acceptjobs[index].company.location)),
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
                        style: TextStyle(
                            color: extra,
                            fontSize:
                                15), // Assuming 'extra' is a defined color
                      ),
                    ),
                  ),
                ],
              );
            },
          ))
    ]);
  }
}

class Jobcardwidget extends StatelessWidget {
  final JobModel job;

  Jobcardwidget({this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(defaultPaddinghight),
        child: Row(
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
              width: defaultPaddingwidth * 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    child: Text(job.jobTitle,
                        style: TextStyle(
                          color: headline,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ))),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/2.svg",
                        width: 12,
                        height: 12,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          child: Text(job.company.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ]),
                SizedBox(
                  height: 7,
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
                          child: Text(job.company.location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ))),
                    ]),
                SizedBox(
                  height: 7,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/clock.svg",
                        width: 13,
                        height: 13,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (job.workTimeTypeId == 1)
                        SizedBox(
                          child: Text(
                            "FullTime",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      if (job.workTimeTypeId == 0)
                        SizedBox(
                          child: Text(
                            "Part time",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 30,
                      ),
                    ]),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // width: 300,
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return JobDetailsDialog(job);
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
          ],
        ),
      ),
    );
  }
}

class JobGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobController>(context);

    var accepted = provider.jobModel
        .where((jobs) => jobs.accept == 1)
        .toList();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 5 cards in each row
        childAspectRatio:
            5 / 3, // Adjust this value to change the card's aspect ratio
      ),
      itemBuilder: (BuildContext context, int index) {
        return Jobcardwidget(job: accepted[index]);
      },
      itemCount: accepted.length,
    );
  }
}

class JobDetailsDialog extends StatefulWidget {
  JobDetailsDialog(this.job);
  JobModel job;
  @override
  State<JobDetailsDialog> createState() => _JobDetailsDialog();
}

class _JobDetailsDialog extends State<JobDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: background),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(color: bgColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Image(
                          image: AssetImage(data.logo),
                          fit: BoxFit.contain,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        // padding: const EdgeInsets.fromLTRB(500, 0, 500, 0),
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
                            backgroundColor: Color.fromARGB(
                                255, 129, 38, 31), // Set button color to red
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
                                'Delete Post',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${widget.job.jobTitle}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: headline),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              "Salary: ",
                              style: TextStyle(fontSize: 20, color: extra),
                            ),
                            Text(
                              "${widget.job.salaryStart} - ${widget.job.salaryEnd}",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              "Location: ",
                              style: TextStyle(fontSize: 20, color: extra),
                            ),
                            Text(
                              ' ${widget.job.company.location}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Company Information:',
                          style: TextStyle(fontSize: 20, color: extra),
                        ),
                        SizedBox(height: 1),
                        ListTile(
                          title: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/employers.svg",
                                width: 15,
                                height: 15,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.job.company.name,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ],
                          ),
                          // subtitle: Row(
                          //   children: [
                          //     Icon(
                          //       Icons.location_on,
                          //       size: 15,
                          //       color: primaryColor,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       data.company[0]['address'],
                          //       style: TextStyle(
                          //           fontSize: 17, color: Colors.white),
                          //     ),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            if (widget.job.workTypeId == 1)
                              _buildDetailText('Work Type:', "In office"),
                            if (widget.job.workTypeId != 1)
                              _buildDetailText('Work Type:', "Remotly"),
                            SizedBox(width: 30),
                            if (widget.job.workTimeTypeId == 1)
                              _buildDetailText('Work Time:', "FullTime"),
                            if (widget.job.workTimeTypeId != 1)
                              _buildDetailText('Work Time:', "PartTime"),
                          ],
                        ),
                        SizedBox(height: 16),
                        _buildDetailText('Email:', widget.job.company.email),
                        SizedBox(height: 16),
                        Text(
                          'Education Requirements:',
                          style: TextStyle(fontSize: 20, color: extra),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.job.educations.length,
                          itemBuilder: (context, index) {
                            var requirement =
                                widget.job.educations[index];
                            return ListTile(
                              title: Text(
                                requirement.title,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              subtitle: Text(
                                requirement.description,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey[400]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Experience Requirements:',
                            style: TextStyle(fontSize: 20, color: extra)),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.job.experiences.length,
                          itemBuilder: (context, index) {
                          var requirement =
                               widget.job.experiences[index];
                            return ListTile(
                              title: Text(
                                requirement.title,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              subtitle: Text(
                                requirement.description,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey[400]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Skill :',
                          style: TextStyle(fontSize: 20, color: extra),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.job.skills.length,
                          itemBuilder: (context, index) {
                           var proficiency =
                                widget.job.skills[index];
                            return ListTile(
                              title: Text(
                                proficiency.title,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              subtitle: Text(
                                "${proficiency.stars}",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey[400]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description:  ",
                              style: TextStyle(fontSize: 20, color: extra),
                            ),
                            Container(
                              width: 900,
                              height: 200,
                              color: bgColor,
                              child: Text(
                                widget.job.description,
                                style: TextStyle(fontSize: 16),
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class JobDetailsDialog2 extends StatefulWidget {
  JobDetailsDialog2(this.job);
  JobModel job;

  @override
  State<JobDetailsDialog2> createState() => _JobDetailsDialog2();
}

class _JobDetailsDialog2 extends State<JobDetailsDialog2> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: background),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(color: bgColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Image(
                          image: AssetImage(data.logo),
                          fit: BoxFit.contain,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Container(
                            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () async {
                              {
                                    JobController accept =
                                        JobController();
                                    await accept.acceptJob(
                                        widget.job.id);
                                    AwesomeDialog(
                                      width: 400,
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title:
                                          "the post has been added successfully",
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
                                    'Accept Post',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
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
                                    'Delete Post',
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
                  SizedBox(width: 50),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${widget.job.jobTitle}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: headline),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              "Salary: ",
                              style: TextStyle(fontSize: 20, color: extra),
                            ),
                            Text(
                              "${widget.job.salaryStart} - ${widget.job.salaryEnd}",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              "Location: ",
                              style: TextStyle(fontSize: 20, color: extra),
                            ),
                            Text(
                              ' ${data.country}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Company Information:',
                          style: TextStyle(fontSize: 20, color: extra),
                        ),
                        SizedBox(height: 1),
                        ListTile(
                          title: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/employers.svg",
                                width: 15,
                                height: 15,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.job.company.name,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ],
                          ),
                          // subtitle: Row(
                          //   children: [
                          //     Icon(
                          //       Icons.location_on,
                          //       size: 15,
                          //       color: primaryColor,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       data.company[0]['address'],
                          //       style: TextStyle(
                          //           fontSize: 17, color: Colors.white),
                          //     ),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            if (widget.job.workTypeId == 1)
                              _buildDetailText('Work Type:', "In office"),
                            if (widget.job.workTypeId!= 1)
                              _buildDetailText('Work Type:', "Remotly"),
                            SizedBox(width: 30),
                            if (widget.job.workTimeTypeId== 1)
                              _buildDetailText('Work Time:', "FullTime"),
                            if (widget.job.workTimeTypeId != 1)
                              _buildDetailText('Work Time:', "PartTime"),
                          ],
                        ),
                        SizedBox(height: 16),
                        _buildDetailText('Email:', widget.job.company.email),
                        SizedBox(height: 16),
                        Text(
                          'Education Requirements:',
                          style: TextStyle(fontSize: 20, color: extra),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.job.educations.length,
                          itemBuilder: (context, index) {
                           var requirement =
                                widget.job.educations[index];
                            return ListTile(
                              title: Text(
                                requirement.title,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              subtitle: Text(
                                requirement.description,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey[400]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Experience Requirements:',
                            style: TextStyle(fontSize: 20, color: extra)),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.job.experiences.length,
                          itemBuilder: (context, index) {
                           var requirement =
                               widget.job.experiences[index];
                            return ListTile(
                              title: Text(
                                requirement.title,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              subtitle: Text(
                                requirement.description,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey[400]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Skill :',
                          style: TextStyle(fontSize: 20, color: extra),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.job.skills.length,
                          itemBuilder: (context, index) {
                           var proficiency =
                               widget.job.skills[index];
                            return ListTile(
                              title: Text(
                                proficiency.title,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              subtitle: Text(
                                "${proficiency.stars}",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey[400]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description:  ",
                              style: TextStyle(fontSize: 20, color: extra),
                            ),
                            Container(
                              width: 900,
                              height: 200,
                              color: bgColor,
                              child: Text(
                                widget.job.description,
                                style: TextStyle(fontSize: 16),
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
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
