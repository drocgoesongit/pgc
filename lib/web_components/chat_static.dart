import 'package:flutter/material.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class WebChatStatic extends StatefulWidget {
  WebChatStatic({
    super.key,
  });

  @override
  State<WebChatStatic> createState() => _WebChatStaticState();
}

class _WebChatStaticState extends State<WebChatStatic> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex:
              1, // Set flex to 1 to make this container take all available vertical space
          child: Card(
            elevation: 2,
            surfaceTintColor: Colors.white,
            shape: ContinuousRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Chats",
                    style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10), // Add some space between the two containers
        Expanded(
          flex:
              2, // Set flex to 1 to make this container take all available vertical space
          child: ClipPath(
            clipper: ShapeBorderClipper(
              shape: ContinuousRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Chat with owner",
                        style: kSmallParaTextStyle.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  RecentChat(
                    image: "assets/images/profile.png",
                    id: "Jane D.",
                    chat: "Ill be there",
                    timestamp: "12:54",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryBlueSoftenCustomColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: primaryBlueSoftenCustomColor,
                            // controller: _messageController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 16,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Write your message',
                              hintStyle:
                                  TextStyle(fontFamily: "Gilroy", fontSize: 14),
                            ),
                            // focusNode: _messageFocusNode,
                            onChanged: (value) {},
                            maxLines: null,
                            minLines: 1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle microphone icon onTap
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 7.0),
                                  child: Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: primaryBlueSoftenCustomColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle microphone icon onTap
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 7.0),
                                  child: Icon(
                                    Icons.mic_rounded,
                                    color: primaryBlueSoftenCustomColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // message = _messageController.text.trim();
                                  // await sendMessage(context);
                                  // _messageController.clear();
                                },
                                child: Icon(
                                  Icons.send_rounded,
                                  color: primaryBlueSoftenCustomColor,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
