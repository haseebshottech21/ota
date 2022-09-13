import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/model/user_model.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/view_model/subleads_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../widgets/common/dialogbox.dart';

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

    // final sublead = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sub Leads',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: const Icon(CupertinoIcons.clear, color: Colors.black),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.add, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, RouteName.createSubLeadD);
            },
          ),
        ],
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
                    return subLead.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
                            child: Center(
                              child: Text(
                                'NO SUB LEAD\'s FOUND',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 12, 0.0, 4),
                            child: ListView.builder(
                              itemCount: subLead.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return SubLeadCardItem(
                                  userSubLead: subLead[index],
                                );
                              },
                            ),
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

// class SubLeadCardItem extends StatefulWidget {
//   final User userSubLead;
//   const SubLeadCardItem({
//     required this.userSubLead,
//     Key? key,
//     // required this.size,
//   }) : super(key: key);

//   @override
//   State<SubLeadCardItem> createState() => _SubLeadCardItemState();
// }

// class _SubLeadCardItemState extends State<SubLeadCardItem> {
//   // final Size size;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     // final sublead = context.watch<LeadsViewModel>();
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           RouteName.subLeadDetail,
//           arguments: widget.userSubLead.id.toString(),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
//           width: size.width,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: kElevationToShadow[1],
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
//                     // padding: const EdgeInsets.symmetric(
//                     //   horizontal: 10,
//                     //   vertical: 8,
//                     // ),
//                     decoration: BoxDecoration(
//                       // color: const Color(0xFF3c7cbc).withOpacity(0.7),
//                       borderRadius: BorderRadius.circular(4.0),
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color(0xFF08a7dc),
//                           Color(0xFF1393d0),
//                         ],
//                       ),
//                     ),
//                     child: const Text(
//                       'H',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: size.width * 0.02),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(widget.userSubLead.name.toString()),
//                       SizedBox(height: size.height * 0.004),
//                       Text(widget.userSubLead.email.toString()),
//                       SizedBox(height: size.height * 0.006),
//                     ],
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     onTap: () {
//                       Future(
//                         () {
//                           showModalBottomSheet(
//                             backgroundColor: Colors.white,
//                             context: context,
//                             // isScrollControlled: true,
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(15.0),
//                               ),
//                             ),
//                             builder: (BuildContext context) {
//                               return Container(
//                                 constraints: BoxConstraints(
//                                   maxHeight: MediaQuery.of(context).size.height,
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                         top: 8,
//                                         bottom: 12,
//                                         left: 12,
//                                         right: 12,
//                                       ),
//                                       child: Container(
//                                         height: 6,
//                                         width: 70,
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey[500],
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                     ),
//                                     Column(
//                                       children: [
//                                         bottomModelItem(
//                                           context: context,
//                                           icon: delete,
//                                           title: 'Delete',
//                                           subTitle: 'Delete this sub lead',
//                                           onTap: () {
//                                             // leadViewModel.deleteSubLeadApi(
//                                             //   leadId: userSubLead.id.toString(),
//                                             //   context: context,
//                                             // );

//                                             Navigator.of(context).pop();

//                                             showDialog(
//                                               context: context,
//                                               barrierDismissible:
//                                                   false, // user must tap button!
//                                               builder: (BuildContext context) {
//                                                 return Consumer<LeadsViewModel>(
//                                                     builder: (context,
//                                                         leadViewModel, _) {
//                                                   return AlertDialog(
//                                                     titlePadding:
//                                                         const EdgeInsets.only(
//                                                             top: 16, left: 24),
//                                                     contentPadding:
//                                                         const EdgeInsets.only(
//                                                             top: 2,
//                                                             bottom: 12,
//                                                             left: 24,
//                                                             right: 24),
//                                                     title:
//                                                         Text('Confirm Delete'),
//                                                     content: Text(
//                                                       'Delete ?',
//                                                       style: const TextStyle(
//                                                         color: Colors.black87,
//                                                         fontSize: 14,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                       ),
//                                                     ),
//                                                     actions: <Widget>[
//                                                       TextButton(
//                                                         child: const Text(
//                                                           'Cancel',
//                                                           style: TextStyle(
//                                                             color: Colors.black,
//                                                           ),
//                                                         ),
//                                                         onPressed: () {
//                                                           Navigator.of(context)
//                                                               .pop();
//                                                         },
//                                                       ),
//                                                       TextButton(
//                                                         child: const Text(
//                                                           'Confirm',
//                                                           style: TextStyle(
//                                                             color: Colors.black,
//                                                           ),
//                                                         ),
//                                                         onPressed: () {
//                                                           // Navigator.of(context)
//                                                           //     .pop();

//                                                           leadViewModel
//                                                               .deleteSubLeadApi(
//                                                             leadId: widget
//                                                                 .userSubLead.id
//                                                                 .toString(),
//                                                             context: context,
//                                                           );

//                                                           // context
//                                                           //     .read<
//                                                           //         LeadsViewModel>()
//                                                           //     .deleteSubLeadApi(
//                                                           //       leadId: widget
//                                                           //           .userSubLead
//                                                           //           .id
//                                                           //           .toString(),
//                                                           //       context: context,
//                                                           //     );
//                                                         },
//                                                       ),
//                                                     ],
//                                                   );
//                                                 });
//                                               },
//                                             );
//                                             // Future.delayed(Duration.zero).then(
//                                             //   (value) {
//                                             //     simpleDialog(
//                                             //         context: context,
//                                             //         title: 'Confirm Delete',
//                                             //         subTitle:
//                                             //             'Are you sure delete it ?',
//                                             //         press: () {
//                                             //           // setState(() {});
//                                             //           Navigator.pop(context);
//                                             //         }

//                                             //         // context
//                                             //         //     .read<LeadsViewModel>()
//                                             //         //     .deleteSubLeadApi(
//                                             //         //       leadId: userSubLead.id
//                                             //         //           .toString(),
//                                             //         //       context: context,
//                                             //         //     );
//                                             //         // Navigator.of(context).pop();
//                                             //         );
//                                             //   },
//                                             // );

//                                             // print(
//                                             //   'Delete ${widget.userSubLead.id.toString()}',
//                                             // );
//                                             // context
//                                             //     .read<LeadsViewModel>()
//                                             //     .deleteSubLeadApi(
//                                             //       leadId:
//                                             //           userSubLead.id.toString(),
//                                             //       context: context,
//                                             //     );
//                                           },
//                                         ),
//                                         // bottomModelItem(
//                                         //   context: context,
//                                         //   icon: notificationMute,
//                                         //   title: 'Turn Off',
//                                         //   subTitle:
//                                         //       'Stop receiving notifications like this',
//                                         // ),
//                                         // bottomModelItem(
//                                         //   context: context,
//                                         //   icon: setting,
//                                         //   title: 'View Settings',
//                                         // ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 20),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                           // });

//                           // showModalBottomSheet(
//                           //   context: context,
//                           //   shape: const RoundedRectangleBorder(
//                           //     borderRadius: BorderRadius.vertical(
//                           //       top: Radius.circular(15.0),
//                           //     ),
//                           //   ),
//                           //   builder: (BuildContext context) {
//                           //     return SingleChildScrollView(
//                           //       child: Column(
//                           //         mainAxisSize: MainAxisSize.min,
//                           //         // crossAxisAlignment:
//                           //         //     CrossAxisAlignment.stretch,
//                           //         children: [
//                           //           Padding(
//                           //             padding: const EdgeInsets.only(
//                           //               top: 8,
//                           //               bottom: 12,
//                           //               left: 12,
//                           //               right: 12,
//                           //             ),
//                           //             child: Container(
//                           //               height: 6,
//                           //               width: 70,
//                           //               decoration: BoxDecoration(
//                           //                 color: Colors.grey[500],
//                           //                 borderRadius:
//                           //                     BorderRadius.circular(8),
//                           //               ),
//                           //             ),
//                           //           ),
//                           //           GestureDetector(
//                           //             onTap: () {
//                           //               Navigator.pop(context);
//                           //               showDialog(
//                           //                 context: context,
//                           //                 builder: (context) {
//                           //                   return AlertDialog(
//                           //                     titlePadding:
//                           //                         const EdgeInsets.only(
//                           //                             top: 16, left: 24),
//                           //                     contentPadding:
//                           //                         const EdgeInsets.only(
//                           //                             top: 2,
//                           //                             bottom: 12,
//                           //                             left: 24,
//                           //                             right: 24),
//                           //                     title:
//                           //                         const Text('Confirm Delete'),
//                           //                     content: const Text(
//                           //                       'Are you sure to delete ?',
//                           //                       style: TextStyle(
//                           //                         color: Colors.black87,
//                           //                         fontSize: 14,
//                           //                         fontWeight: FontWeight.w400,
//                           //                       ),
//                           //                     ),
//                           //                     actions: <Widget>[
//                           //                       TextButton(
//                           //                         child: const Text(
//                           //                           'Cancel',
//                           //                           style: TextStyle(
//                           //                             color: Colors.black,
//                           //                           ),
//                           //                         ),
//                           //                         onPressed: () {
//                           //                           Navigator.of(context).pop();
//                           //                         },
//                           //                       ),
//                           //                       Consumer<LeadsViewModel>(
//                           //                         builder: (context,
//                           //                             leadViewModel, _) {
//                           //                           return TextButton(
//                           //                             onPressed: () {
//                           //                               leadViewModel
//                           //                                   .deleteSubLeadApi(
//                           //                                 leadId: userSubLead.id
//                           //                                     .toString(),
//                           //                                 context: context,
//                           //                               );
//                           //                               // context
//                           //                               //     .read<
//                           //                               //         LeadsViewModel>()
//                           //                               //     .deleteSubLeadApi(
//                           //                               //       leadId: userSubLead
//                           //                               //           .id
//                           //                               //           .toString(),
//                           //                               //       context: context,
//                           //                               //     );
//                           //                             },
//                           //                             child: const Text(
//                           //                               'Confirm',
//                           //                               style: TextStyle(
//                           //                                 color: Colors.black,
//                           //                               ),
//                           //                             ),
//                           //                           );
//                           //                         },
//                           //                       ),
//                           //                     ],
//                           //                   );
//                           //                 },
//                           //               );
//                           //               // // doSomething();
//                           //               // simpleDialog(
//                           //               //   context: context,
//                           //               //   title: 'Confirm Delete',
//                           //               //   subTitle: 'Are you sure delete it ?',
//                           //               //   onPressed: () {
//                           //               //     context
//                           //               //         .read<LeadsViewModel>()
//                           //               //         .deleteSubLeadApi(
//                           //               //           leadId:
//                           //               //               userSubLead.id.toString(),
//                           //               //           context: context,
//                           //               //         );
//                           //               //   },
//                           //               // );
//                           //             },
//                           //             child: Padding(
//                           //               padding: const EdgeInsets.symmetric(
//                           //                   vertical: 12, horizontal: 15),
//                           //               child: Row(
//                           //                 children: [
//                           //                   Icon(
//                           //                     delete,
//                           //                     color: Theme.of(context)
//                           //                         .iconTheme
//                           //                         .color,
//                           //                     size: 25,
//                           //                   ),
//                           //                   const SizedBox(width: 12),
//                           //                   Column(
//                           //                     crossAxisAlignment:
//                           //                         CrossAxisAlignment.start,
//                           //                     mainAxisAlignment:
//                           //                         MainAxisAlignment.center,
//                           //                     children: const [
//                           //                       Text(
//                           //                         'Delete',
//                           //                         style: TextStyle(
//                           //                           fontSize: 16,
//                           //                           fontWeight: FontWeight.w600,
//                           //                         ),
//                           //                       ),
//                           //                       Text(
//                           //                         'Delete this sub lead',
//                           //                         style: TextStyle(
//                           //                           fontSize: 13,
//                           //                           fontWeight: FontWeight.w400,
//                           //                         ),
//                           //                       ),
//                           //                     ],
//                           //                   )
//                           //                 ],
//                           //               ),
//                           //             ),
//                           //           ),
//                           //           // GestureDetector(
//                           //           //     onTap: () {
//                           //           //       Navigator.pop(context);
//                           //           //       // doSomething();
//                           //           //     },
//                           //           //     child: Text("Item 2")),
//                           //           const SizedBox(height: 20),
//                           //         ],
//                           //       ),
//                           //     );
//                           //   },
//                           // );
//                         },
//                       );
//                     },
//                     child: const Icon(Icons.more_vert_sharp),
//                   )
//                 ],
//               ),
//               SizedBox(height: size.height * 0.04),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     child: const Icon(Icons.calendar_today_sharp),
//                   ),
//                   SizedBox(width: size.width * 0.04),
//                   Container(
//                     padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     child: const Icon(Icons.phone),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget bottomModelItem({
//     required IconData icon,
//     required String title,
//     required BuildContext context,
//     Function()? onTap,
//     String subTitle = '',
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//         child: Row(
//           children: [
//             Icon(icon, color: Theme.of(context).iconTheme.color, size: 25),
//             const SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 subTitle == ''
//                     ? const SizedBox()
//                     : Text(
//                         subTitle,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class SubLeadCardItem extends StatelessWidget {
  final User userSubLead;
  const SubLeadCardItem({
    required this.userSubLead,
    Key? key,
  }) : super(key: key);

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
                  InkWell(
                    onTap: () {
                      Future(
                        () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            // isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                constraints: BoxConstraints(
                                  maxHeight: MediaQuery.of(context).size.height,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 12,
                                        left: 12,
                                        right: 12,
                                      ),
                                      child: Container(
                                        height: 6,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[500],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        bottomModelItem(
                                          context: context,
                                          icon: delete,
                                          title: 'Delete',
                                          subTitle: 'Delete this sub lead',
                                          onTap: () {
                                            // leadViewModel.deleteSubLeadApi(
                                            //   leadId: userSubLead.id.toString(),
                                            //   context: context,
                                            // );

                                            Navigator.of(context).pop();

                                            showDialog<bool>(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  titlePadding:
                                                      const EdgeInsets.only(
                                                          top: 16, left: 24),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 12,
                                                          left: 24,
                                                          right: 24),
                                                  title: const Text(
                                                      'Confirm Delete'),
                                                  content: const Text(
                                                    'Delete ?',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop<bool>(false);
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: const Text(
                                                        'Confirm',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                LeadsViewModel>()
                                                            .deleteSubLeadApi(
                                                              leadId: userSubLead
                                                                  .id
                                                                  .toString(),
                                                              context: context,
                                                            );
                                                        // Navigator.of(context)
                                                        //     .pop();

                                                        // leadViewModel
                                                        //     .deleteSubLeadApi(
                                                        //   leadId: userSubLead
                                                        //       .id
                                                        //       .toString(),
                                                        //   context: context,
                                                        // );

                                                        // context
                                                        //     .read<
                                                        //         LeadsViewModel>()
                                                        //     .deleteSubLeadApi(
                                                        //       leadId: userSubLead
                                                        //           .id
                                                        //           .toString(),
                                                        //       context: context,
                                                        //     );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            // Future.delayed(Duration.zero).then(
                                            //   (value) {
                                            //     simpleDialog(
                                            //         context: context,
                                            //         title: 'Confirm Delete',
                                            //         subTitle:
                                            //             'Are you sure delete it ?',
                                            //         press: () {
                                            //           // setState(() {});
                                            //           Navigator.pop(context);
                                            //         }

                                            //         // context
                                            //         //     .read<LeadsViewModel>()
                                            //         //     .deleteSubLeadApi(
                                            //         //       leadId: userSubLead.id
                                            //         //           .toString(),
                                            //         //       context: context,
                                            //         //     );
                                            //         // Navigator.of(context).pop();
                                            //         );
                                            //   },
                                            // );

                                            // print(
                                            //   'Delete ${widget.userSubLead.id.toString()}',
                                            // );
                                            // context
                                            //     .read<LeadsViewModel>()
                                            //     .deleteSubLeadApi(
                                            //       leadId:
                                            //           userSubLead.id.toString(),
                                            //       context: context,
                                            //     );
                                          },
                                        ),
                                        // bottomModelItem(
                                        //   context: context,
                                        //   icon: notificationMute,
                                        //   title: 'Turn Off',
                                        //   subTitle:
                                        //       'Stop receiving notifications like this',
                                        // ),
                                        // bottomModelItem(
                                        //   context: context,
                                        //   icon: setting,
                                        //   title: 'View Settings',
                                        // ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.more_vert_sharp),
                  )
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

  Widget bottomModelItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    Function()? onTap,
    String subTitle = '',
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).iconTheme.color, size: 25),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subTitle == ''
                    ? const SizedBox()
                    : Text(
                        subTitle,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
