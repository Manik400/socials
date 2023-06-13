import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socials/screens/signUp.dart';
import 'package:socials/services/postOnLinkedin.dart';
import 'package:socials/utilities/textfield.dart';
import 'package:socials/utilities/buttons.dart';
import 'package:socials/utilities/colors.dart';
// import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:socials/services/signinlinkedin.dart';

class PostScreen extends StatefulWidget {
  static const String id = 'post_screen';
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  double? wid;
  double? heit;
  TextEditingController postcontroller = new TextEditingController();
  void clear() {
    postcontroller.clear();
  }

  List<String> imageUrls = [];

  XFile? Selectedimage;
  String imagename = "";
  final ImagePicker picker = ImagePicker();
  Future<void> getimage(BuildContext context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        Selectedimage = image;
        print(Selectedimage!.path);
        imagename = Selectedimage!.name.toString();
        imagename =
            imagename.substring(0, (imagename.length / 2).toInt()) + "....";
        if (imagename.length >= MediaQuery.of(context).size.width * 0.6) {
          imagename = imagename.substring(
              0, (MediaQuery.of(context).size.width * 0.2).toInt());
        }
        imageUrls.add(Selectedimage!.path);
      }
    });
  }

  Map<String , dynamic>? lld ;
  late String accessToken ;
  late String userId ;

  late String content;
  late String title;
  
  TextEditingController _textEditingController = TextEditingController();
  // TextEditingController _textEditingController1 = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    imageUrls.clear();
    lld = signupscreen().LinkedinData;
    accessToken = lld!['accessToken'];
    userId = lld!['userId'];
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LinkedinPost linkedinPost = LinkedinPost(accessToken , userId);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                // Color(0xfffd864e),
                // Color(0xba362257),
                Colors.black45,
                Colors.black87,
                Colors.black45,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Center(
          child: Text("Create Your Own Post ✔"),
        ),
      ),
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, Orientation) {
          wid = MediaQuery.of(context).size.width;
          heit = MediaQuery.of(context).size.height;
          if (heit! > wid!)
            ;
          else {
            heit = wid!;
            wid = wid! * 0.9;
          }
          return SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                SizedBox(
                  height: heit,
                  width: wid,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: primaryTextField(
                                controller: _textEditingController,
                                hint: "Enter Title",
                                prefix: Icon(Icons.title),
                              )),
                        ),
                        Divider(
                          color: Color(0xfcf7f7f7),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: postcontroller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            decoration: InputDecoration(
                                hoverColor: Colors.white,
                                filled: true,
                                isDense: true,
                                contentPadding: const EdgeInsets.all(12),
                                fillColor: Colors.white,
                                hintText: "Write Your Description",
                                focusColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (imageUrls.isNotEmpty)
                          CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              viewportFraction: 0.9,
                            ),
                            items: imageUrls.map((imageUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  print(imageUrl);
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        if (imageUrls.isEmpty) Text('No images selected.'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                getimage(context);
                              },
                              icon: Icon(
                                Icons.image,
                                color: MyColors.primary,
                              ),
                            ),
                            Text(
                              "(Press again to add more images and slide it left right to see all images)",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: primaryButton(
                          MediaQuery.of(context).size.width / 2.4,
                          title: "Publish",
                          onPressed: ()async{
                            setState(() {
                              content = postcontroller.text;
                              title = _textEditingController.text;
                            });
                            await linkedinPost.createPost(content , title , Selectedimage);
                            Navigator.pop(context);
                          }
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
