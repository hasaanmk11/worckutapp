import 'dart:io';
import 'dart:typed_data';

import 'package:app/responsive/screen_utils.dart';
import 'package:app/user/pages/user_dtls_page/db/db.dart';
import 'package:app/user/pages/user_dtls_page/model/heigth_weigth.dart';
import 'package:app/user/pages/user_dtls_page/widgets/height.dart';
import 'package:app/user/pages/user_dtls_page/widgets/weight.dart';
import 'package:app/user/pages/welcome_page/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController heightCtr = TextEditingController();
  final TextEditingController weightCtr = TextEditingController();

  File? userImageFile;
  Uint8List? userImageBytes;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final screenUtils = ScreenUtils(sizingInfo);

        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 12, 65, 255),
              padding: EdgeInsets.symmetric(
                horizontal: screenUtils.horizontalPadding,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 191, 190, 190),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: _buildUserImage(),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () async {
                        final XFile? pickedFile = await getImage();
                        if (pickedFile != null) {
                          if (kIsWeb) {
                            final bytes = await pickedFile.readAsBytes();
                            setState(() {
                              userImageBytes = bytes;
                              userImageFile = null;
                            });
                          } else {
                            setState(() {
                              userImageFile = File(pickedFile.path);
                              userImageBytes = null;
                            });
                          }
                        }
                      },
                      child: Container(
                        width: screenUtils.isMobile ? double.infinity : 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: const Text("Pick Image"),
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: screenUtils.loginBoxWidth,
                      child: HeightFld(heightCtr),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: screenUtils.loginBoxWidth,
                      child: WeightFil(weightCtr),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () async {
                        if (heightCtr.text.isEmpty ||
                            weightCtr.text.isEmpty ||
                            (userImageFile == null && userImageBytes == null)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please fill all fields and pick an image.",
                              ),
                            ),
                          );
                          return;
                        }

                        final data = HeigthWeigth(
                          imagePath: kIsWeb ? "web_image" : userImageFile!.path,
                          imageBytes: userImageBytes,
                          heigth: heightCtr.text,
                          weigth: weightCtr.text,
                        );

                        await addHeigthAndWeigth(data);

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => welcome()),
                          (route) => false,
                        );
                      },
                      child: Container(
                        width: screenUtils.isMobile ? double.infinity : 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: const Text("Select"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserImage() {
    if (userImageFile != null) {
      return ClipOval(
        child: Image.file(
          userImageFile!,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      );
    } else if (userImageBytes != null) {
      return ClipOval(
        child: Image.memory(
          userImageBytes!,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      );
    } else {
      return const Center(child: Icon(Icons.person, size: 40));
    }
  }
}

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();
  return await picker.pickImage(source: ImageSource.gallery);
}
