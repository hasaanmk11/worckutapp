import 'dart:io';



import 'package:app/user/pages/user_dtls_page/db/db.dart';
import 'package:app/user/pages/user_dtls_page/model/heigth_weigth.dart';
import 'package:app/user/pages/user_dtls_page/widgets/height.dart';
import 'package:app/user/pages/user_dtls_page/widgets/weight.dart';
import 'package:app/user/pages/welcome_page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class dtls extends StatefulWidget {
  dtls({super.key});

  @override
  State<dtls> createState() => _dtlsState();
}

class _dtlsState extends State<dtls> {
  final TextEditingController heightCtr = TextEditingController();

  final TextEditingController weightCtr = TextEditingController();

  var userimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 12, 65, 255),
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
                  child:
                      userimage == null
                          ? const Center(child: Icon(Icons.person, size: 40))
                          : ClipOval(
                            child: Image.file(
                              userimage,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    final XFile? pickedFile = await getImage();
                    if (pickedFile != null) {
                      setState(() {
                        userimage = File(pickedFile.path);
                      });
                    }
                  },

                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("pick image")),
                  ),
                ),
                SizedBox(height: 50),
                HeightFld(heightCtr),
                SizedBox(height: 50),
                WeightFil(weightCtr),
                SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    print(heightCtr.text);
                    print(weightCtr.text);
                    print("printed w and H");
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => welcome()),
                      (route) => false,
                    );

                    final data = HeigthWeigth(
                      imagePath: userimage.path,
                      heigth: heightCtr.text,
                      weigth: weightCtr.text,
                    );

                    await addHeigthAndWeigth(data);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(child: Text("Select")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<XFile?> getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedImage = await picker.pickImage(
    source: ImageSource.gallery,
  );
  return pickedImage;
}
