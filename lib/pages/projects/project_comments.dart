import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/cached_image.dart';

class ProjectComments extends StatelessWidget {
  const ProjectComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.clear, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  // controller: _scrollController,
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const OtherCommentsItem();
                  },
                ),
              ),
              const CommentController(),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentController extends StatelessWidget {
  const CommentController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        color: Colors.grey.shade50,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.only(
            right: 8,
            left: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 15 : 20,
            top: 8,
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.grey.shade500,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: TextField(
                              // controller: textController,
                              minLines: 1,
                              maxLines: 5,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.only(
                                  right: 16,
                                  left: 20,
                                  bottom: 10,
                                  top: 10,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                                hintText: 'Write a comment',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                // if (value.length > 0) {
                                //   hideTheMic();
                                // } else {
                                //   showTheMic();
                                // }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // if (textController.text.length > 0) {
                      //   addToMessages(textController.text);
                      //   textController.clear();
                      //   showTheMic();
                      // }
                    },
                  ),
                  // Row(
                  //   children: [
                  //     Visibility(
                  //       visible: isVisible,
                  //       child: IconButton(
                  //         splashRadius: 20,
                  //         icon: Icon(
                  //           Icons.mic,
                  //           color: Colors.grey.shade700,
                  //         ),
                  //         onPressed: () {
                  //           // slideInputController.play();
                  //         },
                  //       ),
                  //     ),
                  //     IconButton(
                  //       splashRadius: 20,
                  //       icon: Icon(
                  //         Icons.send,
                  //         color: isVisible
                  //             ? Colors.grey.shade700
                  //             : Colors.blue,
                  //       ),
                  //       onPressed: () {
                  //         // if (textController.text.length > 0) {
                  //         //   addToMessages(textController.text);
                  //         //   textController.clear();
                  //         //   showTheMic();
                  //         // }
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherCommentsItem extends StatelessWidget {
  const OtherCommentsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CachedImageWidget(
            height: 40,
            width: 40,
            imgUrl:
                'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
          ),
          Container(
            // constraints: const BoxConstraints(maxWidth: 250),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            margin: const EdgeInsets.only(
              left: 8,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Haseeb Sheikh',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Hey, how are you ?',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
