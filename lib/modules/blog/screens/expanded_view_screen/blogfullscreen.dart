import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/config/routes.dart';
import 'package:new_flutter_assignment/models/screen_argument.dart';
import 'package:new_flutter_assignment/modules/blog/components/blogpost_icon/custom_icon.dart';
import 'package:new_flutter_assignment/modules/blog/components/message_dialog/delete_dialog.dart';
import 'package:new_flutter_assignment/modules/responsive.dart';
import 'package:new_flutter_assignment/providers/blogs_provider.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';

class FullScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final constants = useProvider(constantsProvider);
    final _blogProvider = useProvider(blogProvider);

    //final user = FirebaseAuth.instance.currentUser;
    _deleteprocess() {
      _blogProvider.deleteBlog(id: args.blog!.id!);
      Navigator.popUntil(
          context, ModalRoute.withName(RouteGenerator.blogRoute));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: InkWell(
        onTap: () {
          print('ok');
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(constants.kDefaultPadding * 2, 0,
              constants.kDefaultPadding * 2, 0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              //BLOG CREATOR, DATE BLOG CREATED, 3-DOT OPTION
              Container(
                padding: EdgeInsets.fromLTRB(
                    constants.kDefaultPadding, 0, constants.kDefaultPadding, 0),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          //image: NetworkImage(
                          //     user!.photoURL!), //google account image
                        ),
                      ),
                    ),
                    SizedBox(width: constants.kDefaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jan Eunesse Sevilla',
                          // user.displayName!,
                          style: GoogleFonts.dancingScript(
                              color: Colors.black, fontSize: 13),
                        ),
                        SizedBox(height: constants.kDefaultPadding - 12),
                        Text(
                          args.blog!.date!,
                          style: GoogleFonts.dancingScript(
                              color: Colors.black, fontSize: 11),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    PopupMenuButton(
                      tooltip: 'Options',
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '${RouteGenerator.editblogRoute}',
                                  arguments: ScreenArguments(args.blog));
                            },
                            child: Text('Edit'),
                          ),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              showAlertDialog(context, _deleteprocess);
                            },
                            child: Text('Delete'),
                          ),
                          value: 2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //PICTURE
              Padding(
                padding: EdgeInsets.all(constants.kDefaultPadding - 10),
                child: AspectRatio(
                  aspectRatio: 1.78,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.memory(
                      args.blog!.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //TITLE, WALA PANG SUBTITLE, MAIN BODY
              Padding(
                padding: EdgeInsets.all(constants.kDefaultPadding),
                child: Column(children: [
                  Text(
                    args.blog!.title!,
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32 : 24,
                      fontFamily: "Raleway",
                      color: constants.kDarkBlackColor,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: constants.kDefaultPadding / 2),
                  Text(
                    args.blog!.subtitle!,
                    //maxLines: 2,
                    // overflow: TextOverflow.ellipsis, //add triple dot to text
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 27 : 21,
                      fontFamily: "Raleway",
                      color: constants.kDarkBlackColor,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: constants.kDefaultPadding / 2),
                  Text(
                    args.blog!.content!,
                    style: TextStyle(height: 1.5),
                  ),
                  SizedBox(height: constants.kDefaultPadding),
                  Row(
                    children: [
                      Spacer(),
                      CustomIconButton(icon: FontAwesomeIcons.thumbsUp),
                      CustomIconButton(icon: FontAwesomeIcons.heart),
                      CustomIconButton(icon: FontAwesomeIcons.shareAlt),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
