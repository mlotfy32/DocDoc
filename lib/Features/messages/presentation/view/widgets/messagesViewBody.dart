import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Features/messages/presentation/view/widgets/sendMessages.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Messagesviewbody extends StatefulWidget {
  const Messagesviewbody({super.key});

  @override
  State<Messagesviewbody> createState() => _MessagesviewbodyState();
}

class _MessagesviewbodyState extends State<Messagesviewbody> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Messages',
              style: AppFonts.f18w700,
            ),
            actions: const [Icon(Icons.message)],
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  width: Get.size.width - 50,
                  child: CustomTextField(
                    fillColour: Colors.grey,
                    controller: controller,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search Message',
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.sort,
                  size: 30,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Finn Orn DVM')
                  .where('DrName', isEqualTo: 'Finn Orn DVM')
                  // .orderBy('time')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs;

                  if (documents.isEmpty) {
                    return Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 250),
                          child: Text('No Messages Found',
                              style: AppFonts.f20w700)),
                    );
                  } else {
                    return SizedBox(
                      height: Get.size.height - 200,
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(),
                            );
                          },
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    () => Sendmessages(
                                          description:
                                              documents.last['DrGeneral'],
                                          doctorPic: documents.first['DrPic'],
                                          name: documents.last['DrName'],
                                        ),
                                    curve: Appcurves.curves);
                                log('${documents[0]['userImage']}');
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                            documents[0]['DrPic'],
                                          )),
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        width: Get.size.width - 141,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                'Dr.${documents[0]['DrName']}',
                                                style: AppFonts.f18w600
                                                    .copyWith(
                                                        color: const Color(
                                                            0xff242424)),
                                              ),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                'General | ${documents[0]['DrGeneral']}',
                                                style: AppFonts.f18w600
                                                    .copyWith(
                                                        color: const Color(
                                                            0xff242424)),
                                              ),
                                              Text(
                                                overflow: TextOverflow.clip,
                                                documents.last['message'],
                                                style: AppFonts.f14w400,
                                              )
                                            ]),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${documents.last['time']}',
                                        style: AppFonts.f14w400,
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

// class VideoCallScreen extends StatefulWidget {
//   @override
//   _VideoCallScreenState createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   final String appId =
//       '577feca2691c4a6eba9f26e1b4c57d61'; // استبدل ب App ID الخاص بك
//   final String channelName = 'test_channel'; // اسم القناة
//   final String token =
//       '0d88eff9b14a432780e2e8e0be15ec17'; // استبدل ب Token إذا كنت تستخدمه

//   int? _remoteUid; // UID المستخدم البعيد
//   bool _isJoined = false; // حالة الاتصال بالقناة
//   late RtcEngine _agoraEngine; // Agora RTC Engine

//   @override
//   void initState() {
//     super.initState();
//     _initAgora(); // تهيئة Agora عند بدء التشغيل
//   }

//   Future<void> _initAgora() async {
//     // إنشاء مثيل Agora RTC Engine
//     _agoraEngine = createAgoraRtcEngine();
//     await _agoraEngine.initialize(RtcEngineContext(appId: appId));

//     // تسجيل event handlers للاستماع للأحداث
//     _agoraEngine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           setState(() {
//             _isJoined = true; //
//           });
//           log('تم الانضمام للقناة بنجاح');
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           setState(() {
//             _remoteUid = remoteUid; //
//           });
//           log('تم اكتشاف مستخدم بعيد');
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           setState(() {
//             _remoteUid = null; //
//           });
//           log('المستخدم البعيد غادر القناة');
//         },
//       ),
//     );

//     await _agoraEngine.enableVideo(); // تمكين الفيديو
//     await _agoraEngine.startPreview(); // بدء عرض الفيديو المحلي
//   }

//   // الانضمام إلى القناة
//   void _joinChannel() async {
//     await _agoraEngine.joinChannel(
//       token: token,
//       channelId: channelName,
//       uid: 0,
//       options: const ChannelMediaOptions(),
//     );
//   }

//   // مغادرة القناة
//   void _leaveChannel() async {
//     await _agoraEngine.leaveChannel();
//     setState(() {
//       _isJoined = false;
//       _remoteUid = null;
//     });
//   }

//   @override
//   void dispose() {
//     _agoraEngine.leaveChannel();
//     _agoraEngine.release();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agora Video Call'),
//       ),
//       body: Stack(
//         children: [
//           // عرض الفيديو البعيد
//           Center(
//             child: _remoteUid != null
//                 ? AgoraVideoView(
//                     controller: VideoViewController.remote(
//                     rtcEngine: _agoraEngine,
//                     canvas: VideoCanvas(uid: _remoteUid),
//                     connection: RtcConnection(
//                         channelId: channelName), // إضافة connection هنا
//                   ))
//                 : const Text('Waiting for a remote user to join...'),
//           ),
//           // عرض الفيديو المحلي
//           Align(
//             alignment: Alignment.topLeft,
//             child: SizedBox(
//               width: 100,
//               height: 150,
//               child: Center(
//                 child: _isJoined
//                     ? AgoraVideoView(
//                         controller: VideoViewController(
//                           rtcEngine: _agoraEngine,
//                           canvas: const VideoCanvas(uid: 0),
//                         ),
//                       )
//                     : const CircularProgressIndicator(),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _isJoined ? _leaveChannel : _joinChannel,
//         child: Icon(_isJoined ? Icons.call_end : Icons.call),
//       ),
//     );
//   }
// }
