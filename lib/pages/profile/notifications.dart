import 'package:flutter/material.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/top_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List notifications = [
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': true,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': true,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': true,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': false,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': false,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': false,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': false,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': false,
    },
    {
      'img':
          'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
      'name': 'Mark Rubin',
      'notification':
          'This project is Completed klnasd kjansdknkasd kansdknaksdn kansdknaksdnknasd klnasd',
      'status': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topbar(context, 'NOTIFICATION'),
              // Divider(color: Colors.grey.shade100, thickness: 0.1),
              SingleChildScrollView(
                child: SizedBox(
                  // color: Colors.yellow.shade100,
                  height: MediaQuery.of(context).size.height * 0.90,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: notifications.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(bottom: 0.5),
                          width: MediaQuery.of(context).size.width,
                          // dark
                          // color: notifications[index]['status']
                          //     ? Colors.grey.shade800
                          //     : Colors.grey.shade900,
                          // light
                          color: notifications[index]['status']
                              ? Colors.grey.shade100
                              : Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              notifications[index]['status']
                                  ? Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    )
                                  : const SizedBox(),
                              SizedBox(
                                  width:
                                      notifications[index]['status'] ? 8 : 0),
                              CachedImageWidget(
                                height: 45,
                                width: 45,
                                radius: 50,
                                imgUrl: notifications[index]['img'],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    notifications[index]['name'].toString(),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .color,
                                      // color: Color(0xFF50182c),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    child: Text(
                                      notifications[index]['notification']
                                          .toString(),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                        // color: Color(0xFF50182c),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '41m',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .color,
                                      // color: Color(0xFF50182c),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
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
                                              maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    bottomModelItem(
                                                      icon: delete,
                                                      title: 'Delete',
                                                      subTitle:
                                                          'Delete this notification',
                                                    ),
                                                    bottomModelItem(
                                                      icon: notificationMute,
                                                      title: 'Turn Off',
                                                      subTitle:
                                                          'Stop receiving notifications like this',
                                                    ),
                                                    bottomModelItem(
                                                      icon: setting,
                                                      title: 'View Settings',
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size(25, 25),
                                      primary: Colors.white,
                                      // shadowColor: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomModelItem({
    required IconData icon,
    required String title,
    String subTitle = '',
  }) {
    return InkWell(
      onTap: () {},
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
