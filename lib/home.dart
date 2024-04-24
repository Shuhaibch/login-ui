import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.back,
          color: Colors.white,
        ),
        actions: const [
          Icon(
            Icons.more_vert_sharp,
            color: Colors.white,
          )
        ],
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange.shade300),
                        child: image == null
                            ? null
                            : Image.file(
                                File(
                                  image!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: InkWell(
                          onTap: () async {
                            try {
                              final XFile? imagePicker = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (imagePicker != null) {
                                XFile? _image = imagePicker;
                                setState(() {
                                  image = _image;
                                });
                              } else {
                                /// user canceled.

                                ///
                              }
                            } catch (e) {
                              log(e.toString());
                              print(e);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Mobile Number',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Address',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Details',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    shape: BoxShape.rectangle,
                    color: Colors.orange),
                child: const Center(
                  child: Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<XFile?> _imageHandler() async {
    try {
      final XFile? imagePicker =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imagePicker != null) {
        XFile? _image = imagePicker;
        return _image;
      } else {
        /// user canceled.
        return null;

        ///
      }
    } catch (e) {
      log(e.toString());
      print(e);
      return null;
    }
  }
}
