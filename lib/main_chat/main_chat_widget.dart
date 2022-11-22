import '../add_chat/add_chat_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_messange/chat_messange_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainChatWidget extends StatefulWidget {
  const MainChatWidget({Key? key}) : super(key: key);

  @override
  _MainChatWidgetState createState() => _MainChatWidgetState();
}

class _MainChatWidgetState extends State<MainChatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPumpingHeart(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final mainChatUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            elevation: 8,
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddChatWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.add_comment_rounded,
                color: Color(0xFF587982),
                size: 40,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'sfz57lnl' /* Comunicación con su Medico */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Outfit',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where('users', arrayContains: currentUserReference)
                      .orderBy('last_message_time', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: SpinKitPumpingHeart(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 40,
                        ),
                      ),
                    );
                  }
                  List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewChatsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewChatsRecord =
                          listViewChatsRecordList[listViewIndex];
                      return StreamBuilder<FFChatInfo>(
                        stream: FFChatManager.instance
                            .getChatInfo(chatRecord: listViewChatsRecord),
                        builder: (context, snapshot) {
                          final chatInfo =
                              snapshot.data ?? FFChatInfo(listViewChatsRecord);
                          return FFChatPreview(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatMessangeWidget(
                                  chatUser: chatInfo.otherUsers.length == 1
                                      ? chatInfo.otherUsersList.first
                                      : null,
                                  chatRef: chatInfo.chatRecord.reference,
                                ),
                              ),
                            ),
                            lastChatText: chatInfo.chatPreviewMessage(),
                            lastChatTime: listViewChatsRecord.lastMessageTime,
                            seen: listViewChatsRecord.lastMessageSeenBy!
                                .contains(currentUserReference),
                            title: chatInfo.chatPreviewTitle(),
                            userProfilePic: chatInfo.chatPreviewPic(),
                            color: Color(0xFFEEF0F5),
                            unreadColor: Colors.blue,
                            titleTextStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            dateTextStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: Color(0x73000000),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            previewTextStyle: GoogleFonts.getFont(
                              'DM Sans',
                              color: Color(0x73000000),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                            borderRadius: BorderRadius.circular(0),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
