import 'package:flutter/material.dart';
import 'package:ota/model/user_model.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/view_model/subleads_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';

class SubLeads extends StatefulWidget {
  const SubLeads({Key? key}) : super(key: key);

  @override
  State<SubLeads> createState() => _SubLeadsState();
}

class _SubLeadsState extends State<SubLeads> {
  getAllSubLeads() {
    final provider = Provider.of<LeadsViewModel>(context, listen: false);
    provider.fetchSubLeadsListApi();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllSubLeads();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Sub Leads',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<LeadsViewModel>(
              builder: (context, value, _) {
                // print(value.projectList.status);
                switch (value.subLeadsList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(value.subLeadsList.message.toString()),
                    );
                  case Status.COMPLETE:
                    final subLead = value.subLeadsList.data!.subleads;
                    return ListView.builder(
                      itemCount: subLead.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SubLeadCardItem(userSubLead: subLead[index]);
                      },
                    );
                  default:
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubLeadCardItem extends StatelessWidget {
  final User userSubLead;
  const SubLeadCardItem({
    required this.userSubLead,
    Key? key,
    // required this.size,
  }) : super(key: key);

  // final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteName.subLeadDetail,
          arguments: userSubLead.id.toString(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[1],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 10,
                    //   vertical: 8,
                    // ),
                    decoration: BoxDecoration(
                      // color: const Color(0xFF3c7cbc).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF08a7dc),
                          Color(0xFF1393d0),
                        ],
                      ),
                    ),
                    child: const Text(
                      'H',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userSubLead.name.toString()),
                      SizedBox(height: size.height * 0.004),
                      Text(userSubLead.email.toString()),
                      SizedBox(height: size.height * 0.006),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert_sharp)
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Icon(Icons.calendar_today_sharp),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Icon(Icons.phone),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
