import 'package:flutter/material.dart';
import '../../../../services/app.globals.dart';
import '../../../../services/app.space.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../flutterbase/widgets/flutterbase.page_padding.dart';
import '../../../../flutterbase/widgets/forum/flutterbase.latest_posts.dart';
import '../../../../flutterbase/etc/flutterbase.defines.dart';
import '../../../../flutterbase/etc/flutterbase.globals.dart';
import '../../../../flutterbase/widgets/flutterbase.appbar.dart';
import '../../../../flutterbase/widgets/flutterbase.post_create_action_button.dart';
import '../../../../widgets/app.drawer.dart';

class KoreaFlutterCommunityHomePage extends StatefulWidget {
  KoreaFlutterCommunityHomePage({Key key}) : super(key: key);

  @override
  _KoreaFlutterCommunityHomePageState createState() =>
      _KoreaFlutterCommunityHomePageState();
}

class _KoreaFlutterCommunityHomePageState
    extends State<KoreaFlutterCommunityHomePage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    // final FirebaseAuth _auth = FirebaseAuth.instance;

    // final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
    //   email: 'anemail@gmail.com',
    //   password: 'a^swrd.123',
    // ))
    //     .user;
    // print('user:');
    // print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterbaseAppBar(
        title: t(APP_TITLE),
        actions: FlutterbasePostCreateActionButton(),
        onTapUserPhoto: () =>
            open(fb.loggedIn ? app.registerPage : app.loginPage),
      ),
      endDrawer: AppDrawer(),
      body: FlutterbasePagePadding(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/apps/korea_flutter_community/assets/title.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => open('tutorial'),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 28,
                            child: Image.asset(
                                'lib/apps/korea_flutter_community/assets/icons/youtube_icon.png'),
                          ),
                          AppSpace.spaceBox,
                          Text(
                            '플러터 강좌 모음',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final String url = 'https://open.kakao.com/o/g20m41Mb';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        alert('Could not launch $url');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 28,
                            child: Image.asset(
                                'lib/apps/korea_flutter_community/assets/icons/kakaotalk_icon.png'),
                          ),
                          AppSpace.spaceBox,
                          Text(
                            '한플 채팅방 입장',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    )),
                child: FlutterbaseLatestPosts(
                  route: app.postViewPage,
                  subtitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
