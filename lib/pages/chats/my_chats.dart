import 'package:flutter/material.dart';
import '../../widgets/common/common.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final chats = getChat();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ChatWidget(),
            ChatWidget(),
            ChatWidget(),
            // Column(
            //   children: chats
            //       .map(
            //         (e) => Column(
            //           children: [
            //             ChatWidget(),
            //             chats.indexOf(e) != chats.length - 1
            //                 ? const Divider(
            //                     // indent: 80,
            //                     height: 2,
            //                     thickness: 1,
            //                     // endIndent: 16,
            //                   )
            //                 : const SizedBox(),
            //           ],
            //         ),
            //       )
            //       .toList(),
            // ),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  // final Chat chat;
  const ChatWidget({
    // required this.chat,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      // color: Colors.yellow.shade100,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 8,
        right: 12,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CachedImageWidget(
            height: 50,
            width: 50,
            radius: 40,
            imgUrl:
                'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
          ),
          // const SizedBox(width: 10),
          SizedBox(width: size.width * 0.03),
          SizedBox(
            width: size.width * 0.60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Auth x OTA x Bizhub',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: size.height * 0.004),
                const Text(
                  'John: Any update guys ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '5:06 am',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: size.height * 0.003),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF08a7dc),
                ),
                child: const Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              )
            ],
          ),
          // chat.unReadCount! > 0
          //     ?
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Text(
          //       'chat.lastMessageAt',
          //       style: const TextStyle(
          //         fontSize: 11,
          //         fontWeight: FontWeight.w400,
          //         color: Colors.grey,
          //       ),
          //     ),
          //     SizedBox(height: size.height * 0.008),
          //     Container(
          //       padding: const EdgeInsets.all(6),
          //       decoration: const BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.red,
          //       ),
          //       child: Center(
          //         child: Text(
          //           'chat.unReadCount.toString()',
          //           style: const TextStyle(
          //             fontWeight: FontWeight.w500,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
          // : Text(
          //     chat.lastMessageAt,
          //     style: const TextStyle(
          //       fontSize: 11,
          //       fontWeight: FontWeight.w400,
          //       color: Colors.grey,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
