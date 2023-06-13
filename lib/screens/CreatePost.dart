import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socials/utilities/textfield.dart';
import 'package:socials/utilities/buttons.dart';
import 'package:socials/utilities/colors.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:carousel_slider/carousel_slider.dart';

class cp extends StatefulWidget {
  const cp({super.key});
  _cpState createState() => _cpState();
}

class _cpState extends State<cp> {
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

  @override
  void initState() {
    // TODO: implement initState
    imageUrls.clear();
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: OrientationBuilder(
          builder: (context, Orientation) {
            wid = MediaQuery.of(context).size.width;
            heit = MediaQuery.of(context).size.height;
            if (heit! > wid!)
              ;
            else {
              // double tmp = wid!;
              // wid = heit!;
              // heit = tmp;
              heit = wid!;
              wid = wid! * 0.9;
            }
            return SingleChildScrollView(
              padding: EdgeInsets.all(0),
              child: Container(
                margin: EdgeInsets.all(0),
                // height: (MediaQuery.of(context).size.height) * 1,
                height: heit,
                color: Color(0xfcf7f7f7),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: MyColors.primary,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                              // width: MediaQuery.of(context).size.width,
                              width: wid,
                            ),
                            Text(
                              "Create Your Own Post ✔",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                              // width: MediaQuery.of(context).size.width,
                              width: wid,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height,
                        // width: MediaQuery.of(context).size.width,
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
                                      // controller: emailC,
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
                                  // autofocus: true,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      // prefixIcon:
                                      hoverColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(12),
                                      fillColor: Colors.white,
                                      hintText: "Write Your Description",
                                      focusColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white))),
                                  // suffixIcon:
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
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              if (imageUrls.isEmpty)
                                Text('No images selected.'),
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
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: Icon(
                                  //     Icons.attachment,
                                  //     color: MyColors.primary,
                                  //   ),
                                  // ),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     // add_to_post_list , to be implemented
                                  //     // clear();
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.emoji_emotions,
                                  //     color: MyColors.primary,
                                  //   ),
                                  // ),
                                  Text(
                                    "(Press again to add more images)",
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
                                  title: "Publish"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

// Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Column(
//               children: [
//                 SizedBox(
//                   height: 30,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//                 Text(
//                   "Create Your Own Post ✔",
//                   style: TextStyle(fontSize: 30),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 25,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: primaryTextField(
//                             // controller: emailC,
//                             hint: "Title",
//                             prefix: Icon(Icons.title)))),
//                 Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: primaryTextField(
//                           // controller: emailC,
//                           hint: "Image",
//                           prefix: Icon(Icons.image),
//                           suffix: Icon(Icons.attachment),
//                         ))),
//                 Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                     child: Align(
//                         alignment: Alignment.center,
//                         child: primaryTextField(
//                             // controller: emailC,
//                             hint: "Description",
//                             prefix: Icon(Icons.title)))),
//                 SizedBox(
//                   height: 20,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: primaryButton(MediaQuery.of(context).size.width / 2,
//                     title: "Posted"),
//               ),
//             )
//           ],
//         ),
