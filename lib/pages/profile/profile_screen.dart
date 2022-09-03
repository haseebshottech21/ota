import 'package:flutter/material.dart';
import 'package:ota/themes.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/fade_in_widget.dart';
import 'package:provider/provider.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/common/dialogbox.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List profile = [
    {
      'title': 'Profile Setting',
      'icon': Icons.person_outline,
      'navigate': RouteName.updateMyProfile,
    },
    {
      'title': 'Notification',
      'icon': Icons.notifications_none,
      'navigate': RouteName.notification,
    },
    {
      'title': 'Password',
      'icon': Icons.lock_outline,
      'navigate': RouteName.updatePassword,
    },
    {
      'title': 'Logout',
      'icon': Icons.logout,
      'navigate': '/logout',
    },
  ];

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    // final authViewModel = context.watch<AuthViewModel>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: CachedImageWidget(
                    height: 120,
                    width: 120,
                    radius: 15,
                    imgUrl:
                        'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: MyFadeIn(
                  child: Text(
                    'Bessie Cooper',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      // color: Color(0xFF50182c),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: MyFadeIn(
                  child: Text(
                    'CEO COMPANY',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      // color: Color(0xFF50182c),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'General',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  // model.toggleMode();
                  // print('object');
                  setState(() {
                    // value.darkTheme = !value.darkTheme;
                    switchValue = !switchValue;
                    currentTheme.toggleTheme();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3c7cbc).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          switchValue ? brightOutline : moonOutline,
                          color: const Color(0xFF3c7cbc),
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        switchValue ? 'Light Mode' : 'Dark Mode',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          // color: Color(0xFF50182c),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Theme.of(context).iconTheme.color,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: profile.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (profile[index]['navigate'] == '/logout') {
                            simpleDialog(
                              context: context,
                              title: 'Confirm Logout',
                              subTitle: 'You are about to logout',
                              onPressed: () {
                                Navigator.of(context).pop();
                                // authViewModel.logout(context);
                                context
                                    .read<AuthViewModel>()
                                    .logoutApi(context);
                              },
                            );
                          } else {
                            Future.delayed(const Duration(milliseconds: 400))
                                .then((value) {
                              Navigator.of(context)
                                  .pushNamed(profile[index]['navigate']);
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            left: 16,
                            right: 16,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF3c7cbc).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  profile[index]['icon'],
                                  color: const Color(0xFF3c7cbc),
                                  size: 23,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                profile[index]['title'],
                                style: TextStyle(
                                  color: profile[index]['title'] == 'Logout'
                                      ? const Color(0xFF3c7cbc)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                  // color: Color(0xFF50182c),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              profile[index]['title'] == 'Logout'
                                  ? const SizedBox()
                                  : Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 16,
                                    ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 6),
                      // profile[index]['title'] == 'Logout'
                      //     ? const SizedBox()
                      //     : const Divider(),
                      // const SizedBox(height: 6),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
