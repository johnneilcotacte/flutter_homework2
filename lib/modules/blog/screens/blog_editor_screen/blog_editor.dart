import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/models/blog.dart';
import 'package:new_flutter_assignment/models/screen_argument.dart';
import 'package:new_flutter_assignment/modules/blog/blogpost_inputs_checker.dart';
import 'package:new_flutter_assignment/modules/blog/components/custom_text_field/customtextfield.dart';
import 'package:new_flutter_assignment/modules/blog/components/message_dialog/invalid_dialog.dart';
import 'package:new_flutter_assignment/modules/blog/components/message_dialog/post_delete_dialog.dart';
import 'package:new_flutter_assignment/modules/responsive.dart';
import 'package:new_flutter_assignment/providers/blogs_provider.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class BlogEditor extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String _initialtitle = '';
    String _initialsubtitle = '';
    String _initialcontent = '';
    Uint8List? _initialimage;
    Uuid uuid = Uuid();
    if (args.blog != null) {
      _initialtitle = args.blog!.title!;
      _initialsubtitle = args.blog!.subtitle!;
      _initialcontent = args.blog!.content!;
      _initialimage = args.blog!.image;
    }
    final _image = useState<Uint8List?>(_initialimage);
    final _titlecontroller = useTextEditingController(text: _initialtitle);
    final _subtitlecontroller =
        useTextEditingController(text: _initialsubtitle);
    final _contentcontroller = useTextEditingController(text: _initialcontent);
    final _blogProvider = useProvider(blogProvider);
    final constants = useProvider(constantsProvider);
    final double _height = MediaQuery.of(context).size.height;
    _createBlogObject() {
      final now = new DateTime.now();
      String formatter = DateFormat.yMMMMd('en_US').format(now);

      final blog = Blog(
          id: uuid.v1(),
          title: _titlecontroller.text,
          subtitle: _subtitlecontroller.text,
          content: _contentcontroller.text,
          image: _image.value,
          date: formatter);
      bool status = BlogPostChecker.isComplete(blog);
      if (status) {
        _blogProvider.addBlog(newblog: blog);
        _titlecontroller.clear();
        _subtitlecontroller.clear();
        _contentcontroller.clear();
        _image.value = null;
        showConfirmationDialog(context, 'Your blog is successfully uploaded.');
      } else {
        showInvalidDialog(context);
      }
    }

    _updateBlogObject() {
      final now = new DateTime.now();
      String formatter = DateFormat.yMMMMd('en_US').format(now);
      final blog = Blog(
          id: args.blog!.id,
          title: _titlecontroller.text,
          subtitle: _subtitlecontroller.text,
          content: _contentcontroller.text,
          image: _image.value,
          date: formatter);

      bool status = BlogPostChecker.isComplete(blog);
      if (status) {
        _blogProvider.updateBlog(
            updatedBlog: Blog(
                id: args.blog!.id,
                title: _titlecontroller.text,
                subtitle: _subtitlecontroller.text,
                content: _contentcontroller.text,
                image: _image.value,
                date: formatter));
        _titlecontroller.clear();
        _subtitlecontroller.clear();
        _contentcontroller.clear();
        _image.value = null;
        showConfirmationDialog(context, 'Your blog is successfully updated.');
      } else {
        showInvalidDialog(context);
      }
    }

    //Sauce: https://github.com/miguelpruivo/flutter_file_picker/wiki/API#-getdirectorypath
    Future _pickImage() async {
      //use filepicker rather than ImagePickerWeb. Lang kwenta yung ayaw magsupport ng sdk 2.12.0
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ['png', 'jpeg', 'jpg']);

      if (result != null) {
        _image.value = result.files.first.bytes;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            constants.kDefaultPadding * 2.5,
            constants.kDefaultPadding,
            constants.kDefaultPadding * 2.5,
            constants.kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            if (args.blog == null)
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'CREATE YOUR OWN BLOG',
                  style: GoogleFonts.dancingScript(
                      color: Colors.black,
                      fontSize: (Responsive.isDesktop(context))
                          ? 48
                          : (Responsive.isTablet(context))
                              ? 38
                              : 30),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_image.value != null)
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.windowClose,
                        size: _height * .03,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _image.value = null;
                      }),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(constants.kDefaultPadding - 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Container(
                    width: double.infinity,
                    //height: _height * .7,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: (_image.value != null)
                        ? FittedBox(
                            fit: BoxFit.cover,
                            child: Image.memory(_image.value!),
                          )
                        : IconButton(
                            onPressed: _pickImage,
                            icon: FaIcon(
                              FontAwesomeIcons.image,
                              size: _height * .08,
                              color: Colors.red,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(constants.kDefaultPadding),
              child: Column(children: [
                CustomTextField(
                  controller: _titlecontroller,
                  fontsize: Responsive.isDesktop(context) ? 32 : 24,
                  labelText: 'Title',
                  fontweight: FontWeight.w600,
                  height: 1.3,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _subtitlecontroller,
                  fontsize: Responsive.isDesktop(context) ? 25 : 18,
                  labelText: 'Subtitle',
                  fontweight: FontWeight.w400,
                  height: 1.1,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _contentcontroller,
                  fontsize: Responsive.isDesktop(context) ? 19 : 15,
                  labelText: 'Contents',
                  fontweight: FontWeight.w200,
                  minlines: 6,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: (Responsive.isDesktop(context)) ? 150 : 70,
                    height: (Responsive.isDesktop(context)) ? 50 : 40,
                    child: ElevatedButton(
                      onPressed: (args.blog != null)
                          ? _updateBlogObject
                          : _createBlogObject,
                      child: (args.blog != null)
                          ? Text(
                              'Update',
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 35 : 15,
                              ),
                            )
                          : Text(
                              'Post',
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 35 : 15,
                              ),
                            ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
